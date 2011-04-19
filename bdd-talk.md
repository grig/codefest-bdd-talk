# Behavior-driven development

!SLIDE bulleted

# Behavior-driven development и огурцы
## План

* Что такое behavior driven development
* Причем здесь огурцы
* Пример

!SLIDE bulleted

# Ваш докладчик
## Алексей Григорович

* экс-архитектор в Shamrock Mobile
* Java, Ruby, JS
* TDD-маньяк с 2008г

!SLIDE bulleted

# Behavior Driven Development
## План

* __Что это__
* <span class="deemph">Причем здесь огурцы</span>
* <span class="deemph">Пример</span>

!SLIDE

# Behavior Driven Development
## Что это

!NOTE

## как я дошел до жизни такой
### (историческая перспектива)
* в какой-то момент мне надоело, что качество моих программ не всегда на высоте
* цель -- "в основном корректные" программы на выходе из разработки
** то есть, как минимум все "happy paths" должны проходить
* нужны тесты
* человек слаб
* единственный способ гарантировать писать тесты -- это TDD
** поскольку гарантирует, что тесты действительно будут написаны

!SLIDE bulleted

# Проблемы наивного TDD

* __модульные тесты не гарантируют работоспособность системы__

!NOTE

* То есть, нужны интеграционные тесты на компоненты
* или более дисциплинированный подход / контракты, см. "Integration tests are a scam"

!SLIDE bulleted

# Проблемы наивного TDD

* __модульные тесты не гарантируют работоспособность системы__
    * Решение: интеграционные/функциональные тесты

!SLIDE bulleted

# Проблемы наивного TDD

* модульные тесты не гарантируют работоспособность системы
* __начиная разработку с модульных тестов, легко загнать себя в тупик__

!SLIDE bulleted

# Проблемы наивного TDD

* модульные тесты не гарантируют работоспособность системы
* __начиная разработку с модульных тестов, легко загнать себя в тупик__
    * начинать разработку с высокоуровневых тестов и двигаться вниз

!NOTE

* решение -- начинать разработку с высокоуровневых тестов, проверяющих поведение всей системы, и двигаться вниз
* пользователь может положить майку в корзину
 -> если открыть /tees/123 и кликнуть по кнопке "купить", то мы увидим страницу с корзиной 
 -> если дернуть метод "create" у "OrderItemsController", то отрендерится такая-то страница 
 -> если дернуть метод order.items.create, то в базе создастся новая запись

* outside-in разработка

!SLIDE

# Проблемы наивного TDD

* модульные тесты не гарантируют работоспособность системы
* начиная разработку с модульных тестов, легко загнать себя в тупик
* __высокоуровневые тесты нечитабельны целевой аудиторией__

!NOTE

* хочется сказать: "смотрите, оно сделано и протестировано, такие-то сценарии работают"
* обидно видеть, как тестировщики тратят свое время на повторение того, что уже не раз было пропущено через CI
* хочется вовлечь тестировщиков в написание тестовых сценариев

!SLIDE

# Behavior-driven development

* Разработка начинается с высокоуровневого функционала
* Сценарии пишутся наперед
* В разработку сценариев вовлекаются максимум заинтересованных лиц

!NOTE

функционал закончен, когда все сценарии проходят

заинтересованные лица -- это: 

* заказчик
* или тестировщик как представитель заказчика
* поддержка
* operations
* back-office

!SLIDE bulleted

# Behavior Driven Development
## План

* <span class="deemph">Что это</span>
* __Причем здесь огурцы__
* <span class="deemph">Пример</span>

!SLIDE

# Cucumber: the BDD framework

[http://cukes.info](http://cukes.info)

* Более-менее естественный язык описания сценариев
* Ruby/Java/.NET-библиотеки для проработки сценариев
* Скрипты для запуска

!SLIDE bulleted

# Behavior Driven Development
## План

* <span class="deemph">Что это</span>
* <span class="deemph">Причем здесь огурцы</span>
* __Пример__

!SLIDE

# BDD на примере
## twitter-клиент

!NOTE

К вам приходит начальник и говорит: "слушай, нам надо сделать клиент для твиттера, приступай"
  Достаточно типичная реакция:
    "задача не очень понятная, лучше почитаю хабрахабр"
    "нам нужен фреймворк для твиттер-клиентов"

!SLIDE

# Пример
## Часть функционала twitter-клиента

<pre>
> Как пользователь, я должен уметь видеть свою ленту
</pre>

!SLIDE

# Пример
## Описание функционала

@@@ gherkin
  # features/user_timeline.feature
  Функционал:
      Как пользователь,
      Я должен уметь видеть свою ленту
@@@

!NOTES

  Вопрос: какой самый простой сценарий?

!SLIDE

# Пример
## Описание функционала

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
## Запуск

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
## Реализация шагов на Ruby

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
## Реализация шагов на Java

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
## Пробный запуск

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
## Старт приложения

@@@ ruby
    # features/support/env.rb
    Server.start
    at_exit do
      Server.stop
    end
@@@

!SLIDE

# Пример
## Реализация обработчика для "/username"

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
!SLIDE

# Пример
## Запуск тестов

<pre style="background: black">
<tt><span style='color: gray; background: black; '>#language:&nbsp;ru</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>Функционал:&nbsp;Как&nbsp;пользователь,</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Я&nbsp;должен&nbsp;уметь&nbsp;видеть&nbsp;свою&nbsp;ленту</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Сценарий:&nbsp;только&nbsp;что&nbsp;зарегистрированный&nbsp;пользователь&nbsp;#&nbsp;features/user_timeline.feature:6</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkgreen; background: black; '>Допустим&nbsp;я&nbsp;зарегистрирован&nbsp;в&nbsp;twitter&nbsp;как&nbsp;&quot;</span><span style='color: green; background: black; '>biburat</span><span style='color: darkgreen; background: black; '>&quot;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:4</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkgreen; background: black; '>Если&nbsp;я&nbsp;запрашиваю&nbsp;ленту&nbsp;пользователя&nbsp;&quot;</span><span style='color: green; background: black; '>biburat</span><span style='color: darkgreen; background: black; '>&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:8</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: #8b8b00; background: black; '>То&nbsp;я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/user_timeline.feature:9</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>1&nbsp;scenario&nbsp;(</span><span style='color: #8b8b00; background: black; '>1&nbsp;undefined</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>3&nbsp;steps&nbsp;(</span><span style='color: #8b8b00; background: black; '>1&nbsp;undefined</span><span style='color: gray; background: black; '>,&nbsp;</span><span style='color: darkgreen; background: black; '>2&nbsp;passed</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>0m0.003s</span><span style='color: black; background: black; '><br><br></span><span style='color: #8b8b00; background: black; '>You&nbsp;can&nbsp;implement&nbsp;step&nbsp;definitions&nbsp;for&nbsp;undefined&nbsp;steps&nbsp;with&nbsp;these&nbsp;snippets:</span><span style='color: black; background: black; '><br><br></span><span style='color: #8b8b00; background: black; '>То&nbsp;/^я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту$/&nbsp;do</span><span style='color: black; background: black; '><br></span><span style='color: #8b8b00; background: black; '>&nbsp;&nbsp;pending&nbsp;#&nbsp;express&nbsp;the&nbsp;regexp&nbsp;above&nbsp;with&nbsp;the&nbsp;code&nbsp;you&nbsp;wish&nbsp;you&nbsp;had</span><span style='color: black; background: black; '><br></span><span style='color: #8b8b00; background: black; '>end</span><span style='color: black; background: black; '><br><br></span></tt>
</pre>

!SLIDE

# Пример
## Реализация шагов

@@@ ruby
    Then /я должен увидеть пустую ленту/ do
      assert_xpath "not(//div[id='status'])"
    end
@@@

!SLIDE

# Пример
## Запуск тестов

<pre style="background: black">

<tt></span><span style='color: gray; background: black; '>bash-3.2$&nbsp;cucumber</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>#language:&nbsp;ru</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>Функционал:&nbsp;Как&nbsp;пользователь,</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Я&nbsp;должен&nbsp;уметь&nbsp;видеть&nbsp;свою&nbsp;ленту</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;Сценарий:&nbsp;только&nbsp;что&nbsp;зарегистрированный&nbsp;пользователь&nbsp;#&nbsp;features/user_timeline.feature:6</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkgreen; background: black; '>Допустим&nbsp;я&nbsp;зарегистрирован&nbsp;в&nbsp;twitter&nbsp;как&nbsp;&quot;</span><span style='color: green; background: black; '>biburat</span><span style='color: darkgreen; background: black; '>&quot;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:4</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkgreen; background: black; '>Если&nbsp;я&nbsp;запрашиваю&nbsp;ленту&nbsp;пользователя&nbsp;&quot;</span><span style='color: green; background: black; '>biburat</span><span style='color: darkgreen; background: black; '>&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:8</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;</span><span style='color: darkred; background: black; '>То&nbsp;я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;features/step_definitions/twitter_steps.rb:12</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;expected&nbsp;response&nbsp;text&nbsp;to&nbsp;match&nbsp;&quot;//div[@id='timeline'&nbsp;and&nbsp;not(.//div[@id='status'])&quot;,&nbsp;actual:&nbsp;&quot;&quot;.</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;false&gt;&nbsp;is&nbsp;not&nbsp;true.&nbsp;(Test::Unit::AssertionFailedError)</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:48:in&nbsp;`assert_block'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:500:in&nbsp;`_wrap_assertion'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:46:in&nbsp;`assert_block'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:63:in&nbsp;`assert'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:495:in&nbsp;`_wrap_assertion'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/1.8/test/unit/assertions.rb:61:in&nbsp;`assert'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./features/step_definitions/twitter_steps.rb:25:in&nbsp;`assert_xpath'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;./features/step_definitions/twitter_steps.rb:13:in&nbsp;`/я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту/'</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;features/user_timeline.feature:9:in&nbsp;`То&nbsp;я&nbsp;должен&nbsp;увидеть&nbsp;пустую&nbsp;ленту'</span><span style='color: black; background: black; '><br><br></span><span style='color: darkred; background: black; '>Failing&nbsp;Scenarios:</span><span style='color: black; background: black; '><br></span><span style='color: darkred; background: black; '>cucumber&nbsp;features/user_timeline.feature:6</span><span style='color: gray; background: black; '>&nbsp;#&nbsp;Scenario:&nbsp;только&nbsp;что&nbsp;зарегистрированный&nbsp;пользователь</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>1&nbsp;scenario&nbsp;(</span><span style='color: darkred; background: black; '>1&nbsp;failed</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>3&nbsp;steps&nbsp;(</span><span style='color: darkred; background: black; '>1&nbsp;failed</span><span style='color: gray; background: black; '>,&nbsp;</span><span style='color: darkgreen; background: black; '>2&nbsp;passed</span><span style='color: gray; background: black; '>)</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>0m0.003s</span><span style='color: black; background: black; '><br></span><span style='color: gray; background: black; '>bash-3.2$&nbsp;exit</span><span style='color: black; background: black; '><br><br></span><span style='color: gray; background: black; '>Script&nbsp;done&nbsp;on&nbsp;Wed&nbsp;Mar&nbsp;16&nbsp;15:13:09&nbsp;2011</span><span style='color: black; background: black; '><br></span></tt>
</pre>

!SLIDE

# Пример
## Реализация обработчика для "/username"

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

@@@ gherkin
    Допустим я зарегистрирован в twitter как пользователь "biburat"
    И я добавил статус "zomg добавил твиттер!"
    Если я запрашиваю статусы пользователя "biburat"
    То я должен увидеть такие статусы:
    | статус               |
    | zomg добавил твиттер |
@@@

!SLIDE bulleted

# Сложности

* либо работать с реальным твиттером
    * автоматически либо вручную
* либо работать с заглушкой
    * нужны тесты на заглушку!
    * впрочем, необязательно cucumber

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

!SLIDE

# Вопросы?

## Контакты
* [alex.grigorovich@gmail.com](mailto:alex.grigorovich@gmail.com)
* [@biburat](http://twitter.com/biburat)

## Слайды

* [Эта презентация](http://grig.github.com/codefest-bdd-talk/)
* [Исходники](http://github.com/grig/codefest-bdd-talk/)

