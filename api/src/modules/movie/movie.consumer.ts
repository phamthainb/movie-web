import * as ffmpegInstaller from '@ffmpeg-installer/ffmpeg';
import { Process, Processor } from '@nestjs/bull';
import { Job } from 'bull';

import { InjectRepository } from '@nestjs/typeorm';
import * as ffmpeg from 'fluent-ffmpeg';
import { existsSync, mkdirSync } from 'fs';
import { join } from 'path';
import { cwd } from 'process';
import { Movie, MovieStatus } from './entities/movie.entity';
import { MovieRepository } from './movie.repository';

@Processor('movie')
export class MovieConsumer {
  constructor(@InjectRepository(Movie) private mRepo: MovieRepository) {}

  @Process('mp4-to-m3u8')
  async handleMovie(job: Job<{ movieId: string; file: Express.Multer.File }>) {
    console.log(job.data.movieId);
    const { file, movieId } = job.data;

    job.progress(10);

    if (file) {
      const vid = file;
      const vidName = vid.originalname.split('.')[0];
      const outPath = `upload/m3u8/${vidName}`;

      // check if outputDir exist
      if (!existsSync(outPath)) {
        mkdirSync(outPath, { recursive: true });
      }

      ffmpeg.setFfmpegPath(ffmpegInstaller.path);

      job.progress(30);

      ffmpeg(join(cwd(), vid.path), { timeout: 15 * 1000 })
        .addOptions([
          '-profile:v baseline',
          '-level 3.0',
          '-start_number 0',
          '-hls_time 10',
          '-hls_list_size 0',
          '-f hls',
        ])
        .output(join(cwd(), outPath, `${vidName}.m3u8`))
        .on('error', function (err, stdout, stderr) {
          if (err) {
            console.log(err.message);
            console.log('stdout:\n' + stdout);
            console.log('stderr:\n' + stderr);
          }
        })
        .on('end', () => {
          console.log('Job mp4 to m3u8 => end');
        })
        .run();
      //

      job.progress(70);

      const m = await this.mRepo.findOne({ where: { id: +movieId } });
      m.status = MovieStatus.done;
      m.url = join(outPath, `${vidName}.m3u8`);
      await this.mRepo.save(m);
      job.progress(100);

      await job.moveToCompleted();
    }
  }
}
