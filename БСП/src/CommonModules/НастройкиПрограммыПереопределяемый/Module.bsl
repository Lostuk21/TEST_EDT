
#Область ПрограммныйИнтерфейс

// Предназначена для внесения изменений в форму Обслуживание обработки
// ПанельАдминистрированияБСП без снятия формы с поддержки.
//
// Параметры:
//  Форма - УправляемаяФорма - для внесения изменений.
//
Процедура ОбслуживаниеПриСозданииНаСервере(Форма) Экспорт
	
	// _Демо начало примера
	Если СтандартныеПодсистемыСервер.ЭтоБазоваяВерсияКонфигурации() Тогда
		Форма.Элементы.ГруппаОценкаПроизводительности.Видимость = Ложь;
	КонецЕсли;
	// _Демо конец примера
	
КонецПроцедуры

// Предназначена для внесения изменений в форму ОбщиеНастройки обработки
// ПанельАдминистрированияБСП без снятия формы с поддержки.
//
// Параметры:
//  Форма - УправляемаяФорма - для внесения изменений.
//
Процедура ОбщиеНастройкиПриСозданииНаСервере(Форма) Экспорт
	
КонецПроцедуры

// Предназначена для внесения изменений в форму Обслуживание обработки
// ПанельАдминистрированияБСП без снятия формы с поддержки.
//
// Параметры:
//  Форма - УправляемаяФорма - для внесения изменений.
//
Процедура НастройкиПользователейИПравПриСозданииНаСервере(Форма) Экспорт
	
КонецПроцедуры

// Предназначена для внесения изменений в форму ИнтернетПоддержкаИСервисы обработки
// ПанельАдминистрированияБСП без снятия формы с поддержки.
//
// Параметры:
//  Форма - УправляемаяФорма - для внесения изменений.
//
Процедура ИнтернетПоддержкаИСервисыПриСозданииНаСервере(Форма) Экспорт
	
КонецПроцедуры

// Предназначена для внесения изменений в форму Органайзер обработки
// ПанельАдминистрированияБСП без снятия формы с поддержки.
//
// Параметры:
//  Форма - УправляемаяФорма - для внесения изменений.
//
Процедура ОрганайзерПриСозданииНаСервере(Форма) Экспорт
	
КонецПроцедуры

// Предназначена для внесения изменений в форму СинхронизацияДанных обработки
// ПанельАдминистрированияБСП без снятия формы с поддержки.
//
// Параметры:
//  Форма - УправляемаяФорма - для внесения изменений.
//
Процедура СинхронизацияДанныхПриСозданииНаСервере(Форма) Экспорт
	
КонецПроцедуры

// Предназначена для внесения изменений в форму НастройкиРаботыСФайлами обработки
// ПанельАдминистрированияБСП без снятия формы с поддержки.
//
// Параметры:
//  Форма - УправляемаяФорма - для внесения изменений.
//
Процедура НастройкиРаботыСФайламиПриСозданииНаСервере(Форма) Экспорт
	
КонецПроцедуры

// Предназначена для внесения изменений в форму ПечатныеФормыОтчетыИОбработки обработки
// ПанельАдминистрированияБСП без снятия формы с поддержки.
//
// Параметры:
//  Форма - УправляемаяФорма - для внесения изменений.
//
Процедура ПечатныеФормыОтчетыИОбработкиПриСозданииНаСервере(Форма) Экспорт
	
КонецПроцедуры

#КонецОбласти