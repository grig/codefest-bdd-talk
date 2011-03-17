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
  # features/user_timeline.feature
  Функционал:
      Как пользователь,
      Я должен уметь видеть свою ленту

    Сценарий: только что зарегистрированный пользователь
      Допустим я зарегистрирован в twitter как "biburat"
      Если я запрашиваю ленту пользователя "biburat"
      То я должен увидеть пустую ленту
@@@

!SLIDE dark

# Пример


<pre style="background:black">
<tt>$ cucumber</tt><br>
<tt><span style='color: gray; background: black; '>#language:&nbsp;ru</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>Функционал:&nbsp;Как&nbsp;пользователь,</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Я&nbsp;должен&nbsp;уметь&nbsp;видеть&nbsp;свою&nbsp;ленту</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Сценарий:&nbsp;только&nbsp;что&nbsp;зарегистрированный&nbsp;пользователь&nbsp;#&nbsp;features/user_timeline.feature:6</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: #8b8b00; background: black; '>Допустим&nbsp;я&nbsp;зарегистрирован&nbsp;в&nbsp;twitter&nbsp;как&nbsp;&quot;biburat&quot;&nbsp;#&nbsp;features/user_timeline.feature:7</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: #8b8b00; background: black; '>Если&nbsp;я&nbsp;запрашиваю&nbsp;ленту&nbsp;пользователя&nbsp;&quot;biburat&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/user_timeline.feature:8</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: #8b8b00; background: black; '>То&nbsp;я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/user_timeline.feature:9</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>1&nbsp;scenario&nbsp;(</span><span style='color: #8b8b00; background: black; '>1&nbsp;undefined</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>3&nbsp;steps&nbsp;(</span><span style='color: #8b8b00; background: black; '>3&nbsp;undefined</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>0m0.003s</span><span style='color: black; background: black; '><br><br></span></tt>
</pre>

!NOTE
* скриншот вывода cucumber

Вы уже можете запустить тесты, сценарий будет помечен как "pending"
таким образом можно создавать новые сценарии без опасения поломать билд

!SLIDE 

# Пример
## Ruby

@@@ ruby
    # features/step_definitions/twitter_steps.rb
    Given /я зарегистрирован в twitter как "([^"]*)"/ do |username|
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

        @When("я запрашиваю ленту пользователя \\"(.*)\\"")
        public void whenIRequestStatusesForUser(String username) {
            lastResponse = client.get("/" + username);
        }
    }
@@@

!SLIDE

# Пример

<pre style="background: black;">
<tt><span style='color: gray; background: black; '>#language:&nbsp;ru</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>Функционал:&nbsp;Как&nbsp;пользователь,</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Я&nbsp;должен&nbsp;уметь&nbsp;видеть&nbsp;свою&nbsp;ленту</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Сценарий:&nbsp;только&nbsp;что&nbsp;зарегистрированный&nbsp;пользователь&nbsp;#&nbsp;features/user_timeline.feature:6</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkgreen; background: black; '>Допустим&nbsp;я&nbsp;зарегистрирован&nbsp;в&nbsp;twitter&nbsp;как&nbsp;&quot;</span><span style='color: green; background: black; '>biburat</span><span style='color: darkgreen; background: black; '>&quot;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:3</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkred; background: black; '>Если&nbsp;я&nbsp;запрашиваю&nbsp;ленту&nbsp;пользователя&nbsp;&quot;</span><span style='color: red; background: black; '>biburat</span><span style='color: darkred; background: black; '>&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:7</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Connection&nbsp;to&nbsp;localhost&nbsp;failed&nbsp;(IOError)</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./features/step_definitions/twitter_steps.rb:16:in&nbsp;`get'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./features/step_definitions/twitter_steps.rb:8:in&nbsp;`/я&nbsp;запрашиваю&nbsp;ленту&nbsp;пользователя&nbsp;&quot;([^&quot;]*)&quot;/'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;features/user_timeline.feature:8:in&nbsp;`Если&nbsp;я&nbsp;запрашиваю&nbsp;ленту&nbsp;пользователя&nbsp;&quot;biburat&quot;'</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkcyan; background: black; '>То&nbsp;я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:11</span><span style='color: black; background: black; '><br><br></span><span style='color: darkred; background: black; '>Failing&nbsp;Scenarios:</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>cucumber&nbsp;features/user_timeline.feature:6</span><span style='color: gray; background: black; '>&nbsp;#&nbsp;Scenario:&nbsp;только&nbsp;что&nbsp;зарегистрированный&nbsp;пользователь</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>1&nbsp;scenario&nbsp;(</span><span style='color: darkred; background: black; '>1&nbsp;failed</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>3&nbsp;steps&nbsp;(</span><span style='color: darkred; background: black; '>1&nbsp;failed</span><span style='color: gray; background: black; '>,&nbsp;</span><span style='color: darkcyan; background: black; '>1&nbsp;skipped</span><span style='color: gray; background: black; '>,&nbsp;</span><span style='color: darkgreen; background: black; '>1&nbsp;passed</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>0m0.002s</span><span style='color: black; background: black; '><br></span></tt>
</pre>

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

<pre style="background: black">
<tt><span style='color: gray; background: black; '>#language:&nbsp;ru</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>Функционал:&nbsp;Как&nbsp;пользователь,</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Я&nbsp;должен&nbsp;уметь&nbsp;видеть&nbsp;свою&nbsp;ленту</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Сценарий:&nbsp;только&nbsp;что&nbsp;зарегистрированный&nbsp;пользователь&nbsp;#&nbsp;features/user_timeline.feature:6</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkgreen; background: black; '>Допустим&nbsp;я&nbsp;зарегистрирован&nbsp;в&nbsp;twitter&nbsp;как&nbsp;&quot;</span><span style='color: green; background: black; '>biburat</span><span style='color: darkgreen; background: black; '>&quot;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:4</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkgreen; background: black; '>Если&nbsp;я&nbsp;запрашиваю&nbsp;ленту&nbsp;пользователя&nbsp;&quot;</span><span style='color: green; background: black; '>biburat</span><span style='color: darkgreen; background: black; '>&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:8</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: #8b8b00; background: black; '>То&nbsp;я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/user_timeline.feature:9</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>1&nbsp;scenario&nbsp;(</span><span style='color: #8b8b00; background: black; '>1&nbsp;undefined</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>3&nbsp;steps&nbsp;(</span><span style='color: #8b8b00; background: black; '>1&nbsp;undefined</span><span style='color: gray; background: black; '>,&nbsp;</span><span style='color: darkgreen; background: black; '>2&nbsp;passed</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>0m0.003s</span><span style='color: black; background: black; '><br><br></span><span style='color: #8b8b00; background: black; '>You&nbsp;can&nbsp;implement&nbsp;step&nbsp;definitions&nbsp;for&nbsp;undefined&nbsp;steps&nbsp;with&nbsp;these&nbsp;snippets:</span><span style='color: black; background: black; '><br><br></span><span style='color: #8b8b00; background: black; '>То&nbsp;/^я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту$/&nbsp;do</span><span style='color: black; background: black; '><br></span><span style='color: #8b8b00; background: black; '>&nbsp;&nbsp;pending&nbsp;#&nbsp;express&nbsp;the&nbsp;regexp&nbsp;above&nbsp;with&nbsp;the&nbsp;code&nbsp;you&nbsp;wish&nbsp;you&nbsp;had</span><span style='color: black; background: black; '><br></span><span style='color: #8b8b00; background: black; '>end</span><span style='color: black; background: black; '><br><br></span></tt>
</pre>

!SLIDE

# Пример

@@@ ruby
    Then /я должен увидеть пустую ленту/ do
      assert_xpath "not(//div[id='status'])"
    end
@@@

!SLIDE

# Пример

<pre style="background: black">

<tt></span><span style='color: gray; background: black; '>bash-3.2$&nbsp;cucumber</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>#language:&nbsp;ru</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>Функционал:&nbsp;Как&nbsp;пользователь,</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Я&nbsp;должен&nbsp;уметь&nbsp;видеть&nbsp;свою&nbsp;ленту</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Сценарий:&nbsp;только&nbsp;что&nbsp;зарегистрированный&nbsp;пользователь&nbsp;#&nbsp;features/user_timeline.feature:6</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkgreen; background: black; '>Допустим&nbsp;я&nbsp;зарегистрирован&nbsp;в&nbsp;twitter&nbsp;как&nbsp;&quot;</span><span style='color: green; background: black; '>biburat</span><span style='color: darkgreen; background: black; '>&quot;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:4</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkgreen; background: black; '>Если&nbsp;я&nbsp;запрашиваю&nbsp;ленту&nbsp;пользователя&nbsp;&quot;</span><span style='color: green; background: black; '>biburat</span><span style='color: darkgreen; background: black; '>&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:8</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkred; background: black; '>То&nbsp;я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:12</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;expected&nbsp;response&nbsp;text&nbsp;to&nbsp;match&nbsp;&quot;//div[@id='timeline'&nbsp;and&nbsp;not(.//div[@id='status'])&quot;,&nbsp;actual:&nbsp;&quot;&quot;.</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;false&gt;&nbsp;is&nbsp;not&nbsp;true.&nbsp;(Test::Unit::AssertionFailedError)</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:48:in&nbsp;`assert_block'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:500:in&nbsp;`_wrap_assertion'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:46:in&nbsp;`assert_block'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:63:in&nbsp;`assert'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:495:in&nbsp;`_wrap_assertion'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:61:in&nbsp;`assert'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./features/step_definitions/twitter_steps.rb:25:in&nbsp;`assert_xpath'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./features/step_definitions/twitter_steps.rb:13:in&nbsp;`/я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту/'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;features/user_timeline.feature:9:in&nbsp;`То&nbsp;я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту'</span><span style='color: black; background: black; '><br><br></span><span style='color: darkred; background: black; '>Failing&nbsp;Scenarios:</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>cucumber&nbsp;features/user_timeline.feature:6</span><span style='color: gray; background: black; '>&nbsp;#&nbsp;Scenario:&nbsp;только&nbsp;что&nbsp;зарегистрированный&nbsp;пользователь</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>1&nbsp;scenario&nbsp;(</span><span style='color: darkred; background: black; '>1&nbsp;failed</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>3&nbsp;steps&nbsp;(</span><span style='color: darkred; background: black; '>1&nbsp;failed</span><span style='color: gray; background: black; '>,&nbsp;</span><span style='color: darkgreen; background: black; '>2&nbsp;passed</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>0m0.003s</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>bash-3.2$&nbsp;exit</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>Script&nbsp;done&nbsp;on&nbsp;Wed&nbsp;Mar&nbsp;16&nbsp;15:13:09&nbsp;2011</span><span style='color: black; background: black; '><br></span></tt>
</pre>

!SLIDE

# Пример
## Обработчик для "/username"

@@@ ruby
    # app/controllers/status_controller.rb
    class StatusController < ActionController::Base
      def show
        @statuses = []
        # render a proper template
      end
    end

    # routes.rb
    map "/:username" => "status#show"
@@@

!NOTE

* проверить реальный синтаксис для маршрутов

* показать, что тест проходит


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
