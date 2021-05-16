echo "Copy last history"
if NOT exist .\out\html_report\history\ GOTO :GEN 
robocopy .\out\html_report\history\ .\out\syntaxCheck\allure\history

:GEN 
@rem Конвертация данных allure и вывод отчета
@call allure generate --clean .\out\syntaxCheck\allure .\out\smoke -o .\out\html_report
rem @call allure generate --clean .\out\syntaxCheck\allure -o .\out\html_report
@call allure open .\out\html_report