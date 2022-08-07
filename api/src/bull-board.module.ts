import { createBullBoard } from '@bull-board/api';
import { BullAdapter } from '@bull-board/api/dist/src/queueAdapters/bull';
import { ExpressAdapter } from '@bull-board/express';
import { BullModule, BullModuleOptions, getQueueToken } from '@nestjs/bull';
import { Inject, MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { Queue } from 'bull';

const listQueues: BullModuleOptions[] = [
  {
    name: 'movie',
  },
];

@Module({
  imports: [BullModule.registerQueue(...listQueues)],
})
export class BullBoardModule implements NestModule {
  @Inject(getQueueToken(listQueues[0].name))
  private readonly queue0: Queue;

  configure(consumer: MiddlewareConsumer) {
    const serverAdapter = new ExpressAdapter();
    const { addQueue } = createBullBoard({
      queues: [new BullAdapter(this.queue0)],
      serverAdapter,
    });

    serverAdapter.setBasePath('/admin/queues');
    consumer.apply(serverAdapter.getRouter()).forRoutes('/admin/queues');
  }
}
