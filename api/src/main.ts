import { Logger, ValidationPipe } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import * as express from 'express';
import { join } from 'path';
import { AppModule } from './app.module';
import { SocketIoAdapter } from './websocket/io-adapter';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  const config = new DocumentBuilder()
    .setTitle('Movie web nest')
    .setDescription('Movie web practice')
    .setVersion('1.0')
    .addBearerAuth()
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('/api', app, document);

  app.useStaticAssets(join(__dirname, '..', 'public'));

  app.enableCors({ credentials: true });
  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));
  app.use('/upload', express.static('upload'));

  app.useGlobalPipes(
    new ValidationPipe({
      transform: true,
    }),
  );

  app.useWebSocketAdapter(new SocketIoAdapter(app, app.get(ConfigService)));

  await app.listen(process.env.API_PORT || 3000);
  Logger.warn(`Listening at http://localhost:${process.env.API_PORT || 3000}`);
}
bootstrap();
