#Область ОбработчикиСобытийФормы
&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	// СтандартныеПодсистемы.ДатыЗапретаИзменения
	ДатыЗапретаИзменения.ОбъектПриЧтенииНаСервере(ЭтотОбъект, ТекущийОбъект);
	// Конец СтандартныеПодсистемы.ДатыЗапретаИзменения
КонецПроцедуры

#КонецОбласти
#Область ОбработчикиСобытийЭлементовТаблицыФормыДвижения

&НаКлиенте
Процедура Движения_ДемоОстаткиТоваровВМестахХраненияПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	Если НоваяСтрока Тогда
		СтрокаДанные = Элементы.Движения_ДемоОстаткиТоваровВМестахХранения.ТекущиеДанные;
		СтрокаДанные.Период = Объект.Дата;
		СтрокаДанные.ВидДвижения = ВидДвиженияНакопления.Приход;
	КонецЕсли;
КонецПроцедуры


#КонецОбласти