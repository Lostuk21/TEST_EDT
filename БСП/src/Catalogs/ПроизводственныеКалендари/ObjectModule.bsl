#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	ПроверитьИспользованиеБазовогоКалендаря(Отказ);
КонецПроцедуры

Процедура ПриЗаписи(Отказ)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	КалендарныеГрафики.ОбновитьИспользованиеНесколькихПроизводственныхКалендарей();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПроверитьИспользованиеБазовогоКалендаря(Отказ)
	
	Если ЭтотОбъект.Ссылка.Пустая() Или Не ЗначениеЗаполнено(ЭтотОбъект.БазовыйКалендарь) Тогда
		Возврат;
	КонецЕсли;
	
	// Запрещаем ссылку на самого себя.
	Если ЭтотОбъект.Ссылка = ЭтотОбъект.БазовыйКалендарь Тогда
		ТекстСообщения = НСтр("ru = 'В качестве базового не может быть выбран тот же самый календарь.'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(ТекстСообщения, , , "Объект.БазовыйКалендарь", Отказ);
		Возврат;
	КонецЕсли;
	
	// Если календарь уже является базовым для какого-то другого календаря, 
	// то запрещаем заполнить базовый, чтобы избежать циклических зависимостей.
	
	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("Календарь", ЭтотОбъект.Ссылка);
	Запрос.Текст = 
		"ВЫБРАТЬ ПЕРВЫЕ 1
		|	Ссылка
		|ИЗ
		|	Справочник.ПроизводственныеКалендари КАК ПроизводственныеКалендари
		|ГДЕ
		|	ПроизводственныеКалендари.БазовыйКалендарь = &Календарь";
	РезультатЗапроса = Запрос.Выполнить();
	Если РезультатЗапроса.Пустой() Тогда
		Возврат;
	КонецЕсли;
	
	Выборка = РезультатЗапроса.Выбрать();
	Выборка.Следующий();
	
	ТекстСообщения = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
		НСтр("ru = 'Календарь уже является базовым для календаря «%1» и не может зависеть от другого.'"),
		Выборка.Ссылка);
	ОбщегоНазначенияКлиентСервер.СообщитьПользователю(ТекстСообщения, Выборка.Ссылка, , "Объект.БазовыйКалендарь", Отказ);
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли