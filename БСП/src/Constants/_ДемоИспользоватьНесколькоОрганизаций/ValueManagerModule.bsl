#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ПриЗаписи(Отказ)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	УстановитьПривилегированныйРежим(Истина);
	
	Константы._ДемоНеИспользоватьНесколькоОрганизаций.Установить(НЕ ЭтотОбъект.Значение);
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли
