﻿#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОписаниеПеременных

Перем КонтекстЯдра; // ядро xunit
Перем Ожидаем; // модуль BDD ( УтвержденияBDD);
Перем ГенерацияДанных; // модуль (СериализаторMXL)

// Расположение плагинов по умолчанию
// C:\Program Files\OneScript\lib\add\plugins

#КонецОбласти

#Область ПрограммныйИнтерфейс

// Процедура - Инициализация
//
// Параметры:
//  КонтекстЯдраПараметр - ядро xunit	 - 
//
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	Ожидаем = КонтекстЯдра.Плагин("УтвержденияBDD");
	ГенерацияДанных = КонтекстЯдра.Плагин("СериализаторMXL");

КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестов) Экспорт	
	
	НаборТестов.НачатьГруппу("Тестирование методов HTTP");
//	НаборТестов.Добавить("Тест_ВыполнитьМетодGET", "Тест должен выполнить метод GET");	
	
КонецПроцедуры

Процедура ПередЗапускомТеста() Экспорт
	НачатьТранзакцию();
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	Если ТранзакцияАктивна() Тогда
		ОтменитьТранзакцию();
	КонецЕсли; 	
КонецПроцедуры

#КонецОбласти

#Область ЮнитТесты

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

#КонецОбласти

#Область СлужебныеПроцедурыИФункции


#КонецОбласти

#Область Инициализация

#КонецОбласти
    
#Иначе
 ВызватьИсключение НСтр("ru = 'Недопустимый вызов объекта на клиенте.'");
#КонецЕсли