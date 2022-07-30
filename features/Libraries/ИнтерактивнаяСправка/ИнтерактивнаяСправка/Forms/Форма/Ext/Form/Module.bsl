﻿&НаКлиенте
Перем ФормаОбработкиVA;

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Automation
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Automation.
Перем КонтекстСохраняемый Экспорт;

// Делает отключение модуля
&НаКлиенте
Функция ОтключениеМодуля() Экспорт

	Ванесса = Неопределено;
	Контекст = Неопределено;
	КонтекстСохраняемый = Неопределено;

КонецФункции

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСпрашиваюИмяУченикаЕслиОноНеЗадано()","ЯСпрашиваюИмяУченикаЕслиОноНеЗадано","И я спрашиваю имя ученика если оно не задано","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюVanessaAutomationВРежимеОбучения()","ЯОткрываюVanessaAutomationВРежимеОбучения","И я открываю Vanessa Automation в режиме обучения","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПозиционируюВЦентрСтрокуРедактораVAВРежимеОбучения(Парам01)","ЯПозиционируюВЦентрСтрокуРедактораVAВРежимеОбучения","И я позиционирую в центр строку редактора VA в режиме обучения 21","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУстанавливаюТекущуюСтрокуРедактораРежимОбучения(Парам01)","ЯУстанавливаюТекущуюСтрокуРедактораРежимОбучения","И я устанавливаю текущую строку редактора режим обучения 10","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыделяюСтрокиВРедактореСПоВРежимеОбучения(Парам01,Парам02)","ЯВыделяюСтрокиВРедактореСПоВРежимеОбучения","И я выделяю строки в редакторе с 1 по 10 в режиме обучения","","");
	

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Функция выполняется перед началом каждого сценария
Функция ПередНачаломСценария() Экспорт
	
КонецФункции

&НаКлиенте
// Функция выполняется перед окончанием каждого сценария
Функция ПередОкончаниемСценария() Экспорт
	
КонецФункции



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И я спрашиваю имя ученика если оно не задано
//@ЯСпрашиваюИмяУченикаЕслиОноНеЗадано()
Функция ЯСпрашиваюИмяУченикаЕслиОноНеЗадано() Экспорт
	
	Если КонтекстСохраняемый.Свойство("ИмяУченика") Тогда
		Если ЗначениеЗаполнено(КонтекстСохраняемый.ИмяУченика) Тогда
			Возврат Неопределено;
		КонецЕсли;	 
	КонецЕсли;	 
	
	Ванесса.ВоспроизвестиФразуАсинхронно("Чтобы продолжить укажите ваше имя, пожалуйста.");
	
	Ванесса.ЗапретитьВыполнениеШагов();
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ПослеВводаИмениУченика", ЭтаФорма);
	ПоказатьВводСтроки(ОписаниеОповещения, , "Введите ваше имя");
	
КонецФункции

&НаКлиенте
Функция ПослеВводаИмениУченика(ИмяУченика, ДопПараметры) Экспорт
	
	Если ЗначениеЗаполнено(ИмяУченика) Тогда
		КонтекстСохраняемый.Вставить("ИмяУченика", ИмяУченика);
	Иначе	
		КонтекстСохраняемый.Вставить("ИмяУченика", "Ученик");
	КонецЕсли;	 
	
	Ванесса.ПродолжитьВыполнениеШагов();
	
КонецФункции

&НаКлиенте
//И я открываю Vanessa Automation в режиме обучения
//@ЯОткрываюVanessaAutomationВРежимеОбучения()
Функция ЯОткрываюVanessaAutomationВРежимеОбучения() Экспорт
	
	Если Ванесса.ЗапрещеныСинхронныеВызовы Тогда
		ВызватьИсключение Ванесса.Локализовать("Необходимо разрешить выполнение синхронных вызовов. Достаточно запустить сеанс 1С не из конфигуратора.");
	КонецЕсли;	 
	
	Ванесса.ЗапретитьВыполнениеШагов();
	
	Если Ванесса.Объект.ВерсияПоставки = "single" Тогда
		ПутьКVA = Ванесса.ДополнитьСлешВПуть(Ванесса.Объект.КаталогИнструментов) + "vanessa-automation-single.epf";
	Иначе	
		ПутьКVA = Ванесса.ДополнитьСлешВПуть(Ванесса.Объект.КаталогИнструментов) + "vanessa-automation.epf";
	КонецЕсли;
	
	ПомещаемыйФайл = Новый ОписаниеПередаваемогоФайла(ПутьКVA);
	ПомещаемыеФайлы = Новый Массив;
	ПомещаемыеФайлы.Добавить(ПомещаемыйФайл);
	
	ПараметрыЗавершения = Новый Структура;
	ПараметрыЗавершения.Вставить("ПутьКVA", ПутьКVA);
	ОписаниеОповещения = Новый ОписаниеОповещения("ПослеПомещенияФайлаVA", ЭтаФорма, ПараметрыЗавершения);
	НачатьПомещениеФайлов(ОписаниеОповещения, ПомещаемыеФайлы,, Ложь, ЭтаФорма.УникальныйИдентификатор);
	
КонецФункции

&НаКлиенте
Функция ПослеПомещенияФайлаVA(Знач ПомещенныеФайлы, Знач ДополнительныеПараметры) Экспорт
	
	
	Для Каждого ПомещенныйФайл Из ПомещенныеФайлы Цикл
		ДополнительныеПараметрыПодключения = Новый Структура;
		ДополнительныеПараметрыПодключения.Вставить("АдресХранилища",ПомещенныйФайл.Хранение);
		ДополнительныеПараметрыПодключения.Вставить("ИмяФайла",ДополнительныеПараметры.ПутьКVA);
		ИмяОбработки = ПодключитьВнешнююОбработкуСервер(ПомещенныйФайл.Хранение,Ванесса.ЕстьЗащитаОтОпасныхДействий,ДополнительныеПараметрыПодключения);
		
		ПодключениеОбработкиПродолжение(ИмяОбработки);
		Возврат Неопределено;
	КонецЦикла;	 
	
	Ванесса.ПродолжитьВыполнениеШагов();
	
КонецФункции

&НаСервереБезКонтекста
Функция ПодключитьВнешнююОбработкуСервер(Знач АдресХранилища,ИспользуетсяЗащитаОтОпасныхДействий,ДополнительныеПараметры = Неопределено) Экспорт
	ИмяОбработки = Неопределено;
	Если ИспользуетсяЗащитаОтОпасныхДействий Тогда
		ОписаниеЗащитыОтОпасныхДействий = Вычислить("Новый ОписаниеЗащитыОтОпасныхДействий");
		ОписаниеЗащитыОтОпасныхДействий.ПредупреждатьОбОпасныхДействиях = Ложь;
		
		Обработка = ПолучитьОбработкуИзФайлаЧерезМетодСоздать(ДополнительныеПараметры,ИмяОбработки);
		Если Обработка = Неопределено Тогда
			Если ТипЗнч(ДополнительныеПараметры) = Тип("Структура") Тогда
				Если ДополнительныеПараметры.Свойство("АдресХранилища") Тогда
					ИмяОбработки = ВнешниеОбработки.Подключить(ДополнительныеПараметры.АдресХранилища, , Ложь, ОписаниеЗащитыОтОпасныхДействий);
				Иначе	
					ИмяОбработки = ВнешниеОбработки.Подключить(АдресХранилища, , Ложь, ОписаниеЗащитыОтОпасныхДействий);
				КонецЕсли;	 
			КонецЕсли;	 
		КонецЕсли;	 
		ПроверитьОбработкуНаВозможностьПодключения(ИмяОбработки);
		
		Возврат ИмяОбработки;
	Иначе	
		Обработка = ПолучитьОбработкуИзФайлаЧерезМетодСоздать(ДополнительныеПараметры,ИмяОбработки);
		Если Обработка = Неопределено Тогда
			Если ДополнительныеПараметры.Свойство("АдресХранилища") Тогда
				ИмяОбработки = ВнешниеОбработки.Подключить(ДополнительныеПараметры.АдресХранилища, , Ложь); 
			Иначе	
				ИмяОбработки = ВнешниеОбработки.Подключить(АдресХранилища, , Ложь); 
			КонецЕсли;	 
			ПроверитьОбработкуНаВозможностьПодключения(ИмяОбработки);
		КонецЕсли;	 
		Возврат ИмяОбработки;
	КонецЕсли;	 
КонецФункции 

&НаСервереБезКонтекста
Функция ПолучитьОбработкуИзФайлаЧерезМетодСоздать(ДополнительныеПараметры,ИмяОбработки)
	Обработка = Неопределено;
	Если ТипЗнч(ДополнительныеПараметры) = Тип("Структура") Тогда
		Если ДополнительныеПараметры.Свойство("ИмяФайла") Тогда
			Файл = Новый Файл(ДополнительныеПараметры.ИмяФайла);
			Если Файл.Существует() Тогда
				Обработка = ВнешниеОбработки.Создать(ДополнительныеПараметры.ИмяФайла, Ложь);
				ИмяОбработки = Обработка.Метаданные().Имя;
			КонецЕсли;	 
		КонецЕсли;	 
	КонецЕсли;	 
	
	Возврат Обработка; 
КонецФункции	 

&НаСервереБезКонтекста
Функция ПроверитьОбработкуНаВозможностьПодключения(ИмяОбработки)
	
	Возврат Неопределено;
	
	Обработка = ВнешниеОбработки.Создать(ИмяОбработки,Ложь);
	Попытка
		ПараметрыОбработки = Обработка.ПараметрыОбработки();
	Исключение
		// значит параметры не указаны
		Возврат Неопределено;
	КонецПопытки;
	
	IgnoreOn82 = Ложь;
	ПараметрыОбработки.Свойство("IgnoreOn82",IgnoreOn82);
	
	Если IgnoreOn82 Тогда
		СистемнаяИнформация = Новый СистемнаяИнформация;
		Если Лев(СистемнаяИнформация.ВерсияПриложения,4) = "8.2." Тогда
			ИмяОбработки = Неопределено;
		Иначе
			Попытка
				ТекущийРежимСовместимости = Вычислить("Метаданные.РежимСовместимости");
				РежимыСовместимости = Метаданные.СвойстваОбъектов.РежимСовместимости;
			Исключение
				Возврат Неопределено;
			КонецПопытки;
			
			Если ТекущийРежимСовместимости = РежимыСовместимости.Версия8_1 Тогда
				ИмяОбработки = Неопределено;
			ИначеЕсли ТекущийРежимСовместимости = РежимыСовместимости.Версия8_2_13 Тогда
				ИмяОбработки = Неопределено;
			ИначеЕсли ТекущийРежимСовместимости = РежимыСовместимости.Версия8_2_16 Тогда
				ИмяОбработки = Неопределено;
			КонецЕсли;	 

		КонецЕсли;	 
	КонецЕсли;	 
КонецФункции

&НаКлиенте
Функция ОжиданиеОткрытияФормыVA()
	
	Если ФормаОбработкиVA.СработалиВсеАсинхронныеОбработчикиФормыПриОткрытии = Истина Тогда
		Если Найти(ФормаОбработкиVA.Заголовок, "Режим обучения") = 0 Тогда
			ФормаОбработкиVA.Заголовок = ФормаОбработкиVA.Заголовок + " Режим обучения";
		КонецЕсли;
		ФормаОбработкиVA.ЗапрашиватьПодтверждениеПриЗакрытии = "Нет";
		ФормаОбработкиVA.Объект.ПодключатьГорячуюКлавишуДляПолученияСправкиОбЭлементе = Ложь;
		ФормаОбработкиVA.Объект.DebugLog = Ложь;
		ФормаОбработкиVA.Объект.ТемаРедактораVanessaEditor = Ванесса.Объект.ТемаРедактораVanessaEditor;
		Если ФормаОбработкиVA.Объект.ЯзыкГенератораGherkin <> "ru" Тогда
			ФормаОбработкиVA.Объект.ЯзыкГенератораGherkin = "ru";
			ФормаОбработкиVA.ЯзыкГенератораGherkinПриИзмененииОбработчикЭкспорт();
		КонецЕсли;	 
		Оповестить("ОткрытаФормаVAВРежимеОбучения", ФормаОбработкиVA);
		Ванесса.ПродолжитьВыполнениеШагов();
		ФормаОбработкиVA.ОбработкаДляСеансаВрежимеОбучения();
		ФормаОбработкиVA.ЗакрытьВсеВкладкиРедактора();
		ФормаОбработкиVA.ОчиститьОкноСообщений();
		ФормаОбработкиVA.ПоказатьЧастьКнопокКоманднойПанелиРедактораВРежимеОбучения();
		ФормаОбработкиVA.СкрытьТаблоПеременных();
		ФормаОбработкиVA.ЗакрытьФормуИзвестныхШаговЕслиОнаОткрывалась();
		ФормаОбработкиVA.ЗакрытьФормуСозданияТестовыхДанных();
		ФормаОбработкиVA.ЗакрытьГруппыКоторыеОткрываютсяВРежимеСамотестирования();
		ФормаОбработкиVA.Элементы.ПроверкаРаботыVanessaAutomationВРежимеTestClient.Видимость = Ложь;
		ФормаОбработкиVA.Элементы.СтраницыСервис.ТекущаяСтраница = ФормаОбработкиVA.Элементы.СтраницаСервисОсновные;
		ФормаОбработкиVA.СкрытьЭлементыКоторыеМоглиБытьПоказаныПриРаботеИнтерактивнойСправки();
		ФормаОбработкиVA = Неопределено;
		Возврат Неопределено;
	КонецЕсли;	 
	
	ПодключитьОбработчикОжидания("ОжиданиеОткрытияФормыVA", 1, Истина);
	
КонецФункции 

&НаКлиенте
Функция ПодключениеОбработкиПродолжение(ИмяОбработки)
	ФормаОбработкиVA = ПолучитьФорму("ВнешняяОбработка." + ИмяОбработки + ".Форма.УправляемаяФорма",,,"Обучение");
	ФормаОбработкиVA.Объект.ЗагрузкаФичПриОткрытии = "Не загружать";
	ФормаОбработкиVA.Объект.ДополнительныеПараметры = Новый Структура;
	ФормаОбработкиVA.Объект.ДополнительныеПараметры.Вставить("ЗагрузитьНастройкуКаталогФич", Ложь);
	ФормаОбработкиVA.Объект.ДополнительныеПараметры.Вставить("ВЭтомСеансеИдётОбучение", Истина);
	ФормаОбработкиVA.Открыть();
	
	ПодключитьОбработчикОжидания("ОжиданиеОткрытияФормыVA",1, Истина);
	
КонецФункции 

&НаКлиенте
//И я позиционирую в центр строку редактора VA в режиме обучения 21
//@ЯПозиционируюВЦентрСтрокуРедактораVAВРежимеОбучения(Парам01)
Функция ЯПозиционируюВЦентрСтрокуРедактораVAВРежимеОбучения(НомерСтроки) Экспорт
	
	ЭкземплярVanessaEditor = КонтекстСохраняемый.ФормаVAВРежимеОбучения.ПолучитьVanessaEditor();
	ЭкземплярVanessaEditor.revealLineInCenter(НомерСтроки, "");
	
КонецФункции

&НаКлиенте
//И я устанавливаю текущую строку редактора режим обучения 10
//@ЯУстанавливаюТекущуюСтрокуРедактораРежимОбучения(Парам01)
Функция ЯУстанавливаюТекущуюСтрокуРедактораРежимОбучения(НомерСтроки) Экспорт
	ЭкземплярVanessaEditor = КонтекстСохраняемый.ФормаVAВРежимеОбучения.ПолучитьVanessaEditor();
	ЭкземплярVanessaEditor.setPosition(Число(НомерСтроки), 1, "");
КонецФункции

&НаКлиенте
//И я выделяю строки в редакторе с 1 по 10 в режиме обучения
//@ЯВыделяюСтрокиВРедактореСПоВРежимеОбучения(Парам01,Парам02)
Функция ЯВыделяюСтрокиВРедактореСПоВРежимеОбучения(НомСтр1, НомСтр2) Экспорт
	ЭкземплярVanessaEditor = КонтекстСохраняемый.ФормаVAВРежимеОбучения.ПолучитьVanessaEditor();
	ЭкземплярVanessaEditor.setSelection(НомСтр1, 1, НомСтр2+1, 1);
КонецФункции
