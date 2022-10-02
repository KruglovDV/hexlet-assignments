# Качество

Автоматизированное тестирование – неотъемлемая часть процесса программирования в профессиональной среде. Тесты — единственный надёжный способ убедиться в работоспособности кода. Они не избавляют от багов, но позволяют держать их количество на приемлемом уровне. Тесты дают уверенность, что изменения в одной части системы, не сломали другие части.

## Ссылки

* [Testing Rails Applications](https://guides.rubyonrails.org/testing.html) - инструкация Rails по тестированию приложений
* [Чек-лист хороших инженерных практик в компаниях](https://guides.hexlet.io/ru/check-list-of-engineering-practices/)
* [Начинаем писать тесты (правильно)](https://ru.hexlet.io/blog/posts/how-to-test-code)

## Задачи

### app/controllers/bulletins_controller.rb

Напишите обработчики для экшенов *index*, *show*.

### /app/views/bulletins/index.html.erb

Выведите список всех сущностей.

### app/views/bulletins/show.html.erb

Выведите показ объявления.

### test/fixtures/bulletins.yml

Заполните фикстуры для модели *Bulletin*.

### test/controllers/bulletins_controller_test.rb

Напишите тесты для экшенов *index*, *show*.
