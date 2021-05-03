echo "Copy last history"
robocopy .\out\html_report\history\ .\out\syntaxCheck\allure\history

@rem Конвертация данных allure и вывод отчета
@call allure generate --clean .\out\syntaxCheck\allure .\out\smoke  -o .\out\html_report
@call allure open .\out\html_report