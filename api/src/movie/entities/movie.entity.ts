import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type MovieDocument = Movie & Document;

// "original_title": "The Shawshank Redemption",
// "year": 1994,
// "duration": 142,
// "genre": "Drama",
// "director": "Frank Darabont",
// "writer": "Stephen King, Frank Darabont",
// "production_company": "Castle Rock Entertainment",
// "actors": "Tim Robbins, Morgan Freeman, Bob Gunton, William Sadler, Clancy Brown, Gil Bellows, Mark Rolston, James Whitmore, Jeffrey DeMunn, Larry Brandenburg, Neil Giuntoli, Brian Libby, David Proval, Joseph Ragno, Jude Ciccolella",
// "description": "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
// "avg_vote": 9.3,
// "votes": 2278845

@Schema()
export class Movie {
  @Prop({ type: String })
  title: string;

  @Prop()
  year: number;

  @Prop()
  duration: number;

  @Prop()
  genre: string; // category

  @Prop()
  director: string;

  @Prop()
  writer: string;

  @Prop()
  production_company: string;

  @Prop()
  actors: string;

  @Prop()
  description: string;

  @Prop()
  avg_vote: number;
}

export const MovieSchema = SchemaFactory.createForClass(Movie);
