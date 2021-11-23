# Описание 

![Stars](https://img.shields.io/github/stars/maximsamokhval/First-steps-vanessa-runner?style=for-the-badge)
![forks](https://img.shields.io/github/forks/maximsamokhval/First-steps-vanessa-runner?style=for-the-badge)
[![telegram](https://img.shields.io/badge/telegram-channel-blue.svg?style=for-the-badge)](https://t.me/automation_community)
![last commit](https://img.shields.io/github/last-commit/maximsamokhval/autoRemove-Scheduled-jobs?style=for-the-badge)
[![YouTube](https://img.shields.io/badge/youtube-channel-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/playlist?list=PLB1FqRhexVy65PCet9YFZ9uHAh6hu2C24)

## 1 Настройка окружения

* [OneScript](https://oscript.io/) - Инструмент автоматизации для специалистов по 1С
* [Vanessa Runner](https://github.com/vanessa-opensource/vanessa-runner) - репозиторий
* [Пример файла настроек vrunner](https://github.com/vanessa-opensource/vanessa-runner/blob/develop/examples/example.env.json)
* [GitSync](https://github.com/oscript-library/gitsync) - github репозиторий 
* [ADD](https://github.com/vanessa-opensource/add) - плагин ADD, репозиторий
* [GitSync 3.0. Шпаргалка по использованию](https://infostart.ru/1c/articles/1157400/) - настройка плагина gitSync
* [Демонстрационная конфигурация 1С](https://its.1c.ru/db/metod8dev/content/5028/hdoc)

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
