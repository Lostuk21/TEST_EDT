#Область ПрограммныйИнтерфейс

// Вызывается для получения контактов (участников) по указанному предмету взаимодействия.
// Используется, если в конфигурации определен хотя бы один предмет взаимодействий.
//
// Параметры:
//  ИмяТаблицыКонтактов   - Строка - имя таблицы предмета взаимодействий, в котором требуется выполнить поиск.
//                                   Например, "Документы.ЗаказПокупателя".
//  ТекстЗапросаДляПоиска - Строка - в этот параметр указать фрагмент запроса для поиска. При выполнении запроса 
//                                   в параметр запроса &Предмет подставляется ссылка на предмет взаимодействия.
//
Процедура ПриПоискеКонтактов(Знач ИмяТаблицыКонтактов, ТекстЗапросаДляПоиска) Экспорт
	
	// _Демо начало примера
	Если ИмяТаблицыКонтактов = Метаданные.Документы.ЗаказПокупателя.ПолноеИмя() Тогда
		ТекстЗапросаДляПоиска = Документы.ЗаказПокупателя.ТекстЗапросаПоКонтактам(Истина);
	КонецЕсли;
	// _Демо конец примера
	
КонецПроцедуры	

// Позволяет переопределить владельца присоединенных файлов для письма.
// Такая необходимость может возникнуть, например, при массовых рассылках, когда имеет смысл 
// хранить одни и те же присоединенные файлы в одном месте, а не тиражировать их на все письма рассылки.
//
// Параметры:
//  Письмо - ДокументСсылка.ЭлектронноеПисьмоВходящее, ДокументСсылка.ЭлектронноеПисьмоИсходящее - электронное письмо, 
//           для которого необходимо получить вложения.
//  ПрисоединенныеФайлы - Структура - задать сведения о файлах, присоединенных к письму:
//    * ВладелецФайлов                     - ОпределяемыйТип.ПрисоединенныйФайл - владелец присоединенных файлов.
//    * ИмяСправочникаПрисоединенныхФайлов - Строка - имя объекта метаданных присоединенных файлов.
//
Процедура ПриПолученииПрисоединенныхФайлов(Письмо, ПрисоединенныеФайлы) Экспорт

КонецПроцедуры

// Вызывается для настройки логики ограничения доступа к взаимодействиям.
// Пример заполнения наборов значений доступа см. в комментарии
// к процедуре УправлениеДоступом.ЗаполнитьНаборыЗначенийДоступа.
//
// Параметры:
//  Объект - ДокументОбъект.Встреча,
//           ДокументОбъект.ЗапланированноеВзаимодействие,
//           ДокументОбъект.СообщениеSMS,
//           ДокументОбъект.ТелефонныйЗвонок,
//           ДокументОбъект.ЭлектронноеПисьмоВходящее,
//           ДокументОбъект.ЭлектронноеПисьмоИсходящее - объект, для которого нужно заполнить наборы.
//  
//  Таблица - ТаблицаЗначений - возвращаемая функцией УправлениеДоступом.ТаблицаНаборыЗначенийДоступа.
//
Процедура ПриЗаполненииНаборовЗначенийДоступа(Объект, Таблица) Экспорт
	
	// _Демо начало примера
	// Подсистема "Управление доступом".
	
	_ДемоСтандартныеПодсистемы.ПриЗаполненииНаборовЗначенийДоступаДляОбъектаВзаимодействия(Объект, Таблица)
	
	// Подсистема "Управление доступом".
	// _Демо конец примера
	
КонецПроцедуры

#Область УстаревшиеПроцедурыИФункции

// Устарела. Следует использовать ВзаимодействияПереопределяемый.ПриПоискеКонтактов.
// Возвращает текст запроса, отбирающего контакты (участников) предмета взаимодействия.
// Используется, если в конфигурации определен хотя бы один предмет взаимодействий.
//
// Параметры:
//  УдалитьПомещатьВоВременнуюТаблицу - Булево - всегда Ложь.
//  ИмяТаблицы                        - Строка - имя таблицы предмета взаимодействий, в котором будет выполнен поиск.
//  УдалитьОбъединить                 - Булево - всегда Истина.
//
// Возвращаемое значение:
//  Строка - текст запроса.
//
Функция ТекстЗапросаПоискКонтактовПоПредмету(УдалитьПомещатьВоВременнуюТаблицу, ИмяТаблицы, УдалитьОбъединить = Ложь) Экспорт
	
	Возврат "";
	
КонецФункции

// Устарела. Следует использовать ВзаимодействияПереопределяемый.ПриПолученииПрисоединенныхФайлов.
// Возможность переопределить владельца присоединенных файлов для письма.
// Такая необходимость может возникнуть например при массовых рассылках. В этом случае имеет смысл 
// хранить одни и те же присоединенные файлы в одном месте, а не тиражировать их на все письма рассылки.
//
// Параметры:
//  Письмо  - ДокументСсылка, ДокументОбъект - документ электронное письмо, для которого необходимо получить вложения.
//
// Возвращаемое значение:
//  Структура, Неопределено  - Неопределено, если присоединенные файлы хранятся при письме.
//                             Структура, если присоединенные файлы хранятся в другом объекте:
//                              * Владелец - ОпределяемыйТип.ПрисоединенныйФайл - владелец присоединенных файлов.
//                              * ИмяСправочникаПрисоединенныеФайлы - Строка - имя объекта метаданных присоединенных файлов.
//
Функция ДанныеОбъектаМетаданныхПрисоединенныхФайловПисьма(Письмо) Экспорт
	
	Возврат Неопределено;
	
КонецФункции

#КонецОбласти

#КонецОбласти
