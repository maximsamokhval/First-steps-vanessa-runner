echo "run syntax-check"
@call vrunner syntax-check --settings ./tools/json/vrunner.json


echo "Copy last history"
robocopy .\out\html_report\history\ .\out\syntaxCheck\allure\history

@rem Конвертация данных allure и вывод отчета
echo "allure generate"
@call allure generate --clean .\out\syntaxCheck\allure -o .\out\html_report
@call allure open .\out\html_report