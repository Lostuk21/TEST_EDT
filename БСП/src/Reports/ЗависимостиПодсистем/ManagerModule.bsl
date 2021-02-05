#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

#Область ДляВызоваИзДругихПодсистем

// СтандартныеПодсистемы.ВариантыОтчетов

// См. ВариантыОтчетовПереопределяемый.НастроитьВариантыОтчетов.
//
Процедура НастроитьВариантыОтчета(Настройки, НастройкиОтчета) Экспорт
	НастройкиОтчета.ОпределитьНастройкиФормы = Истина;
	
	НастройкиВарианта = ВариантыОтчетов.ОписаниеВарианта(Настройки, НастройкиОтчета, "Основной");
	НастройкиВарианта.Описание = НСтр("ru = 'Поиск недокументированных связей между подсистемами БСП.'");
КонецПроцедуры

// Конец СтандартныеПодсистемы.ВариантыОтчетов

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Только для внутреннего использования.
Функция НекорректныеЗависимостиПодсистемБСП(КаталогВыгрузкиМодулей) Экспорт
	
	ОтчетОбъект = Создать();
	Результат = ОтчетОбъект.ОтчетПоЗависимостям(КаталогВыгрузкиМодулей);
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти

#КонецЕсли