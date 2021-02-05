#Область ПрограммныйИнтерфейс

// В данной процедуре следует описать дополнительные зависимости объектов метаданных
//   конфигурации, которые будут использоваться для связи настроек отчетов.
//
// Параметры:
//   СвязиОбъектовМетаданных - ТаблицаЗначений - Таблица связей.
//       * ПодчиненныйРеквизит - Строка - Имя реквизита подчиненного объекта метаданных.
//       * ПодчиненныйТип      - Тип    - Тип подчиненного объекта метаданных.
//       * ВедущийТип          - Тип    - Тип ведущего объекта метаданных.
//
Процедура ДополнитьСвязиОбъектовМетаданных(СвязиОбъектовМетаданных) Экспорт
	
	// _Демо начало примера
	СтрокаСвязиОтбора = СвязиОбъектовМетаданных.Добавить();
	СтрокаСвязиОтбора.ВедущийТип          = Тип("ДокументСсылка.ЗаказПокупателя");
	СтрокаСвязиОтбора.ПодчиненныйТип      = Тип("ДокументСсылка.СчетНаОплатуПокупателю");
	СтрокаСвязиОтбора.ПодчиненныйРеквизит = "Основание";
	// _Демо конец примера
	
КонецПроцедуры

// Вызывается в форме отчета перед выводом настройки.
//
// Параметры:
//   Форма - УправляемаяФорма, Неопределено - Форма отчета.
//   СвойстваНастройки - Структура - Описание настройки отчета, которая будет выведена в форме отчета.
//       * ОписаниеТипов - ОписаниеТипов -
//           Тип настройки.
//       * ЗначенияДляВыбора - СписокЗначений -
//           Объекты, которые будут предложены пользователю в списке выбора.
//           Дополняет список объектов, уже выбранных пользователем ранее.
//       * ЗапросЗначенийВыбора - Запрос -
//           Возвращает объекты, которыми необходимо дополнить ЗначенияДляВыбора.
//           Первой колонкой (с 0м индексом) должен выбираться объект,
//           который следует добавить в ЗначенияДляВыбора.Значение.
//           Для отключения автозаполнения
//           в свойство ЗапросЗначенийВыбора.Текст следует записать пустую строку.
//       * ОграничиватьВыборУказаннымиЗначениями - Булево -
//           Когда Истина, то выбор пользователя будет ограничен значениями,
//           указанными в ЗначенияДляВыбора (его конечным состоянием).
//
Процедура ПриОпределенииПараметровВыбора(Форма, СвойстваНастройки) Экспорт
	
КонецПроцедуры

// Вызывается в обработчике одноименного события формы отчета после выполнения кода формы.
// См. "УправляемаяФорма.ПриСозданииНаСервере" в синтакс-помощнике. и ОтчетыКлиентПереопределяемый.ОбработчикКоманды().
//
// Параметры:
//   Форма - УправляемаяФорма - Форма отчета.
//   Отказ - Булево - Признак отказа от создания формы.
//   СтандартнаяОбработка - Булево - Признак выполнения стандартной (системной) обработки события.
//
// Пример:
//	//Добавление команды с обработчиком в ОтчетыКлиентПереопределяемый.ОбработчикКоманды:
//	Команда = ФормаОтчета.Команды.Добавить("МояОсобеннаяКоманда");
//	Команда.Действие  = "Подключаемый_Команда";
//	Команда.Заголовок = НСтр("ru = 'Моя команда...'");
//	
//	Кнопка = ФормаОтчета.Элементы.Добавить(Команда.Имя, Тип("КнопкаФормы"), ФормаОтчета.Элементы.<ИмяПодменю>);
//	Кнопка.ИмяКоманды = Команда.Имя;
//	
//	ФормаОтчета.ПостоянныеКоманды.Добавить(КомандаСоздать.Имя);
//
Процедура ПриСозданииНаСервере(Форма, Отказ, СтандартнаяОбработка) Экспорт
	
КонецПроцедуры

// Вызывается в обработчике одноименного события формы отчета или формы настроек отчета.
// См. "Расширение управляемой формы для отчета.ПередЗагрузкойВариантаНаСервере" в синтакс-помощнике.
//
// Параметры:
//   Форма - УправляемаяФорма - Форма отчета или форма настроек отчета.
//   НовыеНастройкиКД - НастройкиКомпоновкиДанных - Настройки для загрузки в компоновщик настроек.
//
Процедура ПередЗагрузкойВариантаНаСервере(Форма, НовыеНастройкиКД) Экспорт
	
	// _Демо начало примера
	Если КлиентскоеПриложение.ТекущийВариантИнтерфейса() = ВариантИнтерфейсаКлиентскогоПриложения.Такси Тогда
		
		ПараметрМакетОформления = НовыеНастройкиКД.ПараметрыВывода.Элементы.Найти("МакетОформления");
		Если ПараметрМакетОформления.Значение = "Main" Или ПараметрМакетОформления.Значение = "Основной" Тогда
			ПараметрМакетОформления.Значение      = "_ДемоОформлениеОтчетовБежевый";
			ПараметрМакетОформления.Использование = Истина;
		КонецЕсли;
		
		Для Каждого ЭлементСтруктуры Из НовыеНастройкиКД.Структура Цикл
			
			Если ТипЗнч(ЭлементСтруктуры) = Тип("НастройкиВложенногоОбъектаКомпоновкиДанных") Тогда
				
				ПараметрМакетОформления = ЭлементСтруктуры.Настройки.ПараметрыВывода.Элементы.Найти("МакетОформления");
				Если ПараметрМакетОформления.Значение = "Main" 
					Или ПараметрМакетОформления.Значение = "Основной" Тогда
					ПараметрМакетОформления.Значение      = "_ДемоОформлениеОтчетовБежевый";
					ПараметрМакетОформления.Использование = Истина;
				КонецЕсли;
				
			КонецЕсли;
			
		КонецЦикла;
		
		// Форма может быть не формой отчета, а формой настроек отчета.
		Если Форма.Элементы.Найти("ОтчетТабличныйДокумент") <> Неопределено Тогда 
			Форма.Элементы.ОтчетТабличныйДокумент.РежимМасштабированияПросмотра = РежимМасштабированияПросмотра.Обычный;
		КонецЕсли;
		
	КонецЕсли;
	// _Демо конец примера
	
КонецПроцедуры

#КонецОбласти
