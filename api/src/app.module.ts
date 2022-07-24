import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { GenreModule } from './genre/genre.module';
import { MovieModule } from './movie/movie.module';
import { UserModule } from './user/user.module';

@Module({
  imports: [
    MongooseModule.forRoot('mongodb://127.0.0.1:27017/movie-web', {
      connectionFactory: (connection) => {
        connection.on('connected', () => {
          console.log('DB is connected');
        });
        connection.on('disconnected', () => {
          console.log('DB disconnected');
        });
        connection.on('error', (error) => {
          console.log('DB connection failed! for error: ', error);
        });
        return connection;
      },
      autoCreate: true,
    }),
    MovieModule,
    GenreModule,
    UserModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
