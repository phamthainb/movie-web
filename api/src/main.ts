import { Logger, ValidationPipe } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import * as express from 'express';
import { AppModule } from './app.module';
import { SocketIoAdapter } from './websocket/io-adapter';

const PORT = 3000;
const SOCKET_PORT = 3006;

// Middleware -> Interceptors -> Route Handler -> Interceptors -> Exception Filter

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const config = new DocumentBuilder()
    .setTitle('Movie web nest')
    .setDescription('Movie web practice')
    .setVersion('1.0')
    .addBearerAuth()
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('/api', app, document);

  app.enableCors({ credentials: true });
  app.use(express.json());
  app.use(express.urlencoded({ extended: true }));

  app.useGlobalPipes(
    new ValidationPipe({
      transform: true,
    }),
  );

  app.useWebSocketAdapter(new SocketIoAdapter(app, app.get(ConfigService)));

  await app.listen(PORT);
  Logger.warn(`Listening at http://localhost:${PORT}`);
}
bootstrap();
