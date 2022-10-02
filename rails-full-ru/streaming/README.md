# Streaming

## Ссылки

* [Apidock — Enumerator](https://apidock.com/ruby/Enumerator)
* [Apidock — CSV](https://apidock.com/ruby/CSV)
* [MDN — Content-Length header](https://developer.mozilla.org/ru/docs/Web/HTTP/Headers/Content-Length)
* [MDN — Cache-Control header](https://developer.mozilla.org/ru/docs/Web/HTTP/Headers/Cache-Control)
* [MDN — Content-Disposition header](https://developer.mozilla.org/ru/docs/Web/HTTP/Headers/Content-Disposition)

## Задачи

### app/controllers/web/users_controller.rb

Реализуйте метод `stream_csv()`, который генерирует отчет в CSV *report.csv* с полным списком пользователей. Для отдачи файла удалите заголовок `Content-Length` и отключите кеширование.

Выполните сиды и сравните скорость скорость скачивания файла в разными способами.
