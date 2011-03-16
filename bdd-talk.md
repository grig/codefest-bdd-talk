# Behavior-driven development

!SLIDE

# О себе
## Алексей Григорович
## twitter.com/biburat

* Java, ruby, JS
* TDD-маньяк с примерно 2008г

!SLIDE

# BDD на примере
## twitter-клиент

!NOTE

К вам приходит начальник и говорит: "слушай, нам надо сделать клиент для твиттера, приступай"
  Достаточно типичная реакция:
    "задача не очень понятная, лучше почитаю хабрахабр"
    "нам нужен фреймворк для твиттер-клиентов"

!SLIDE

# План

1. имплементим клиента для twitter API
2. имплементим GUI
3. ???
4. Profit!

!SLIDE

# На самом деле

1. учимся получать ленту статусов для пользователя
2. реализуем получение статусов в клиенте
3. реализуем отображение статусов в GUI
4. учимся постить статусы в твиттер
...

!SLIDE

# Behavior-driven development

* сценарии как критерий завершения задачи
* минимальные достаточные изменения
* автоматизированное "приемочное" тестирование
* агрессивный рефакторинг

!SLIDE

# Пример
## Часть функционала twitter-клиента

> Как пользователь, я должен уметь посмотреть свою ленту статусов

!NOTES

  Вопрос: какой самый простой сценарий?

!SLIDE

# Пример


@@@ gherkin
    Given a registered Twitter user "biburat"
    When I request statuses for user "biburat"
    Then I should see an empty list
@@@

@@@ gherkin
    # language: ru
    Допустим я зарегистрирован в twitter как "biburat"
    И у меня нет статусов
    Если я запрашиваю свою ленту статусов
    То я должен увидеть пустую ленту с надписью "Здесь ничего нет"
@@@ gherkin

!SLIDE

# Пример

!NOTES
* скриншот вывода cucumber

Вы уже можете запустить тесты, сценарий будет помечен как "pending"
таким образом можно создавать новые сценарии без опасения поломать билд

!SLIDE

# Пример
## Ruby

@@@ ruby
    Given /я зарегистрирован в twitter как "([^"]*)"/ do |username|
      # todo
    end

    Given /у меня нет статусов/ do
      # todo
    end

    When /я запрашиваю ленту пользователя "([^"]*)"/ do |username|
      get "/#{username}"
    end
@@@

!SLIDE

# Пример
## Java

@@@ java
    class TwitterSteps {
        private WebClient client;
        private Response lastResponse;

        public TwitterSteps(WebClient client) { this.client = client; }

        @When("я запрашиваю ленту пользователя \"([^\"]*)\"")
        public void whenIRequestStatusesForUser(String username) {
            lastResponse = client.get("/" + username);
        }
    }
@@@

!SLIDE

# Пример

* тут вывод cucumber *

!NOTES

  В этот момент скорее всего наше приложение начнет валиться
    мы даже не поднимали никакого веб-сервера
      пускаем его вручную перед каждым запуском тестов
      пускаем автоматически из скриптов

!SLIDE

# Пример
## старт приложения

@@@ ruby
    # features/support/env.rb
    Server.start
    at_exit do
      Server.stop
    end
@@@

!SLIDE

# Пример
## Обработчик для "/username"

@@@ ruby
    # app/controllers/status_controller.rb
    class StatusController < ActionController::Base
      def show
        render :text => ""
      end
    end

    # routes.rb
    map "/:username" => "status#show"
@@@

!NOTES

* проверить реальный синтаксис для маршрутов

* показать, что тест проходит

!SLIDE

# Пример

@@@ruby
    Then /я должен увидеть пустую ленту с надписью "([^"]*)"/ do |text|
      assert_xpath "//div[id='statuses']/[text() = '#{text}']"
    end
@@@

!SLIDE

# Пример
## следующий сценарий

@@@ cucumber
    Допустим я зарегистрирован в twitter как пользователь "biburat"
    И я добавил статус "zomg добавил твиттер!"
    Если я запрашиваю статусы пользователя "biburat"
    То я должен увидеть такие статусы:
    | статус               |
    | zomg добавил твиттер |
@@@ cucumber

!SLIDE

# Сложности

* либо работать с реальным твиттером
** автоматически либо вручную
* либо работать с заглушкой
** нужны тесты на заглушку!
** необязательно cucumber, поскольку интересуют почти только разработчиков.

!SLIDE

# Заглушки

@@@ ruby
    # features/support/env.rb
    Server.start
    Stub.start
    at_exit do
      Stub.stop
      Server.stop
    end
@@@

!SLIDE

# Пример

@@@ ruby
    # features/step_definitions/twitter_steps.rb
    Given /я зарегистрирован в twitter как "([^"]*)"/ do |username|
      @user = Stub.register(username)
    end

    Given /я добавил статус "([^"]*)"/ do |text|
      @user.statuses << text
    end

    Before do
      Stub.reset!
    end
@@@

!SLIDE

# Пример

@@@ ruby
    # features/support/stub.rb
    class Stub
      @users = []
      def self.start
        @server = Server.start
      end
      def self.stop
        @server.stop
      end
      def self.register(name)
        @users << User.new(name)
      end
      class Server; end
      class User; end
    end
@@@

