#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныеПроцедурыИФункции

Функция ОтветственныеЛицаОрганизаций(Отбор = Неопределено) Экспорт
	
	ТекстЗапроса =
	"ВЫБРАТЬ
	|	_ДемоОтветственныеЛица.Организация КАК Организация,
	|	_ДемоОтветственныеЛица.ФизическоеЛицо КАК Ответственный
	|ИЗ
	|	РегистрСведений._ДемоОтветственныеЛица КАК _ДемоОтветственныеЛица";
	
	Запрос = Новый Запрос;
	Запрос.Текст = ТекстЗапроса;
	ОтветственныеЛица = Запрос.Выполнить().Выгрузить();
	
	Если ТипЗнч(Отбор) = Тип("Массив") Тогда
		
		ТекстЗапроса =
		"ВЫБРАТЬ
		|	Организации.Ссылка КАК Организация
		|ИЗ
		|	Справочник._ДемоОрганизации КАК Организации
		|ГДЕ
		|	Организации.Ссылка В (&Отбор)
		|
		|УПОРЯДОЧИТЬ ПО
		|	Организации.Наименование";
		
		Запрос = Новый Запрос;
		Запрос.Текст = ТекстЗапроса;
		Запрос.УстановитьПараметр("Отбор", Отбор);
		
	Иначе
		
		ТекстЗапроса =
		"ВЫБРАТЬ
		|	Организации.Ссылка КАК Организация
		|ИЗ
		|	Справочник._ДемоОрганизации КАК Организации
		|ГДЕ
		|	НЕ Организации.ПометкаУдаления
		|
		|УПОРЯДОЧИТЬ ПО
		|	Организации.Наименование";
		
		Запрос = Новый Запрос;
		Запрос.Текст = ТекстЗапроса;
		
	КонецЕсли;
	
	Результат = Запрос.Выполнить().Выгрузить();
	Результат.Колонки.Добавить("Ответственный");
	
	Для Каждого СтрокаТаблицы Из Результат Цикл
		
		Ответственные = ОтветственныеЛица.Найти(СтрокаТаблицы.Организация, "Организация");
		
		Если Ответственные <> Неопределено Тогда
			
			ЗаполнитьЗначенияСвойств(СтрокаТаблицы, Ответственные, "Ответственный");
			
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Результат;
КонецФункции

Функция ДляВсехОрганизацийНазначеныОтветственные(Отбор = Неопределено, Сообщение = "") Экспорт
	
	Результат = Истина;
	СписокОрганизаций = Новый Массив;
	
	Ответственные = ОтветственныеЛицаОрганизаций(Отбор);
	
	Для Каждого СтрокаТаблицы Из Ответственные Цикл
		
		Если Не ЗначениеЗаполнено(СтрокаТаблицы.Ответственный) Тогда
			
			СписокОрганизаций.Добавить(СтрокаТаблицы.Организация);
			
		КонецЕсли;
		
	КонецЦикла;
	
	КоличествоОшибок = СписокОрганизаций.Количество();
	
	Если КоличествоОшибок > 0 Тогда
		
		Результат = Ложь;
		
		Если КоличествоОшибок = 1 Тогда
			
			СтрокаСообщения = НСтр("ru = 'Не назначен ответственный для организации %1.'");
			
		Иначе
			
			СтрокаСообщения = НСтр("ru = 'Не назначены ответственные для организаций:
			|%1.'");
			
		КонецЕсли;
		
		СтрокаОрганизаций = СтрСоединить(СписокОрганизаций, ", ");
		Сообщение = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(СтрокаСообщения, СтрокаОрганизаций);
		
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти

#КонецЕсли