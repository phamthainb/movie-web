import { Process, Processor } from '@nestjs/bull';
import { Job } from 'bull';

@Processor('room_watching')
export class CommentConsumer {
  //   constructor() {}
  // private readonly messageWs: MessageWs

  @Process('board_comment_typing')
  async boardCommentTyping(
    job: Job<{ from: number; to: number; message: string }>,
  ) {
    const { from, to } = job.data;
    // this.messageWs.server
    //   .to(accountIdToSocketId[to])
    //   .emit('notification', 'You get a message from ' + from);
  }
}
