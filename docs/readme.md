# Описание 

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
