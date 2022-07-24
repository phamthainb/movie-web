import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';

@Schema()
export class Genre {
  @Prop()
  name: string;

  @Prop()
  description: string;
}

export type GenreDocument = Genre & Document;

export const GenreSchema = SchemaFactory.createForClass(Genre);
