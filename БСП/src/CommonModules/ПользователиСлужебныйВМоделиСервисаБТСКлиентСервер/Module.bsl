#Область СлужебныеПроцедурыИФункции

// См. эту процедуру в модуле ПользователиСлужебныйВМоделиСервисаБТС.
// Предназначена для поддержки толстого клиента (вариант клиент-сервер).
//
Процедура ОбработкаПолученияФормыПользователя(Источник, ВидФормы, Параметры, ВыбраннаяФорма, ДополнительнаяИнформация, СтандартнаяОбработка) Экспорт
	
	ПользователиСлужебныйВМоделиСервисаБТСВызовСервера.ОбработкаПолученияФормыПользователя(
		Источник,
		ВидФормы,
		Параметры,
		ВыбраннаяФорма,
		ДополнительнаяИнформация,
		СтандартнаяОбработка
	);
	
КонецПроцедуры

#КонецОбласти