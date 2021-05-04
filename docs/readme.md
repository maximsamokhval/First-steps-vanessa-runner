# Описание 

## 1 Настройка окружения

* [OneScript](https://oscript.io/) - Инструмент автоматизации для специалистов по 1С
* [Vanessa Runner](https://github.com/vanessa-opensource/vanessa-runner) - репозиторий
* [Пример файла настроек vrunner](https://github.com/vanessa-opensource/vanessa-runner/blob/develop/examples/example.env.json)
* [GitSync](https://github.com/oscript-library/gitsync) - github репозиторий 
* [ADD](https://github.com/vanessa-opensource/add) - плагин ADD, репозиторий
* [GitSync 3.0. Шпаргалка по использованию](https://infostart.ru/1c/articles/1157400/) - настройка плагина gitSync
* [Демонстрационная конфигурация 1С](https://its.1c.ru/db/metod8dev/content/5028/hdoc)
* [Allure2](https://github.com/allure-framework/allure2/releases) - релизы Allure2
* [Отчетность Allure](https://infostart.ru/1c/articles/1010127/)
  

### Последовательность действий

1. Установка OneScript
2. Установка vanessa-runner `opm install vanessa-runner`
3. Установка плагина ADD `opm install add`
4. Установка плагинов gitsync `opm install gitsync`
   4.1 Настройка плагина limit для gitsync `gitsync plugins enable limit`
   4.2 Настройка плагина check-comments для gitsync `gitsync plugins enable check-comments`
5. Настройка файла vrunner.json

## 2. Структура каталогов

* ./src - хранение исходных файлов конфигурации, полученных с помощью gitsync
* ./docs - документация проекта
* ./tests - файлы с тестами
* ./tools - вспомогательные файлы, директории с настройками

## 3. Синтаксис - проверка конфигурации

### Добавление секции syntax-check 

 * Добавить в файл tools\json\vrunner.json секцию 
 
   "syntax-check": {
        "--groupbymetadata": true,
        "--exception-file": "",
        "--junitpath": "out/syntaxCheck/junit",
        "--allure-results2": "out/syntaxCheck/allure",
        "--ibconnection": "/FC:/Users/Maxim Samokhval/Documents/Bases/Platform8Demo",
        "--db-user": "Администратор",
        "--db-pwd": "",
        "--v8version": "8.3.18",
        "--storage-name": "C:/development/repo/demo",
        "--storage-user": "Администратор",
        "--mode": [
            "-ExtendedModulesCheck",
            "-ThinClient",
            "-WebClient",
            "-Server",
            "-ExternalConnection",
            "-ThickClientOrdinaryApplication",
            "-EmptyHandlers",
            "-UnreferenceProcedures",
            "-ExtendedModulesCheck",
            "-HandlersExistence"
        ]
    }

* [Описание секции --mode](https://yellow-erp.com/help/1cv8/zif3_checkconfig/?lang=ru) - синтаксис проверки

### Параметр секции syntax-check (--exception-file)

* Создать файл syntax_check_exception.txt
* В ключе "--exception-file" секции "syntax-check" добавить путь к файлу
* После первой проверки скопировать необходимые исключения и вставить в файл
* Запустить проверку заново
* В отчетах формата Allure2 эти проверки будут со статусом skipped
* Для вывода лога, добавить ключ "--debuglogfile": true
  
## 4. Генерация отчета в Allure2 формате

* Настройка окружения описана в статье [Настройка Allure2](https://infostart.ru/1c/articles/1010127/)
* Отображение Trends (robocopy)
* Запускаем Скрипт gen_allure_report.cmd

## 5. Добавление дымовых тестов

Подготовка к запуску дымовых тестов 
- Версия vanessa-add 6.6.5 [скачать](https://github.com/vanessa-opensource/add/releases/tag/v6.6.5)

* Изменить файл ./tools/json/vrunner.json (секция xunit)
* Добавить файл ./tools/json/xUnitParams.json (настройки дымовых тестов)
* Создать скрипт smoke-test.cmd
* Добавить в каталог ./tests/smoke обработки из "C:\Program Files\OneScript\lib\add\tests\smoke"
* Описание файла настройки [xUnitParams.json](https://github.com/vanessa-opensource/add/tree/master/tests/smoke#%D0%94%D1%8B%D0%BC%D0%BE%D0%B2%D1%8B%D0%B5-%D1%82%D0%B5%D1%81%D1%82%D1%8B-%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D1%8F%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D1%8F-%D1%84%D0%BE%D1%80%D0%BC-%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%BE%D0%B2-%D0%BC%D0%B5%D1%82%D0%B0%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-%D0%B8-%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F-%D0%BC%D0%B5%D1%82%D0%B0%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85)

