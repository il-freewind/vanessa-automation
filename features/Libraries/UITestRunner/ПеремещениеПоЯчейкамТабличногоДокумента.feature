# language: ru
# encoding: utf-8
#parent uf:
@UF4_Библиотека_шагов
#parent ua:
@UA2_Работать_с_UI_Всплывающие_окна

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOn837
@IgnoreOn836
@ExportScenarios

Функционал: Перемещение по ячейкам табличного документа
	Как Разработчик тестов
	Я хочу, чтобы у меня были стандартные сценарии для перемещения по ячейкам табличного документа в тестируемом приложении
	Чтобы я мог использовать их как вложенные сценарии

@ТипШага: UI.Табличный документ.Переход к ячейке
@Описание: Позволяет переместиться в табличном документе на нужное количество ячеек вправо относительно текущей ячейки
@ПримерИспользования: И в табличном документе "ТабличныйДокумент" я перехожу на "5" ячеек вправо

Сценарий: В табличном документе "РеквизитТабличныйДокумент" я перехожу на "ЧислоЯчеек" ячеек вправо
	И я запоминаю адрес текущей ячейки "РеквизитТабличныйДокумент" в переменную "АдресТекущейЯчейки"
	И я запоминаю значение выражения 'СтрНайти($АдресТекущейЯчейки$, "C")' в переменную "ПозицияСимволаКолонки"
	И я запоминаю значение выражения '"R" + Сред($АдресТекущейЯчейки$, 2, $ПозицияСимволаКолонки$ - 2)' в переменную "АдресСтрокиНовойЯчейки"
	И я запоминаю значение выражения '"C" + Формат(Число(Сред($АдресТекущейЯчейки$, $ПозицияСимволаКолонки$ + 1)) + [ЧислоЯчеек],"ЧГ=0")' в переменную "АдресКолонкиНовойЯчейки"
	И в табличном документе "РеквизитТабличныйДокумент" я перехожу к ячейке "$АдресСтрокиНовойЯчейки$$АдресКолонкиНовойЯчейки$"

@ТипШага: UI.Табличный документ.Переход к ячейке
@Описание: Позволяет переместиться в табличном документе на нужное количество ячеек влево относительно текущей ячейки
@ПримерИспользования: И в табличном документе "ТабличныйДокумент" я перехожу на "5" ячеек влево

Сценарий: В табличном документе "РеквизитТабличныйДокумент" я перехожу на "ЧислоЯчеек" ячеек влево
	И я запоминаю адрес текущей ячейки "РеквизитТабличныйДокумент" в переменную "АдресТекущейЯчейки"
	И я запоминаю значение выражения 'СтрНайти($АдресТекущейЯчейки$, "C")' в переменную "ПозицияСимволаКолонки"
	И я запоминаю значение выражения '"R" + Сред($АдресТекущейЯчейки$, 2, $ПозицияСимволаКолонки$ - 2)' в переменную "АдресСтрокиНовойЯчейки"
	И я запоминаю значение выражения '"C" + Формат(Число(Сред($АдресТекущейЯчейки$, $ПозицияСимволаКолонки$ + 1)) - [ЧислоЯчеек],"ЧГ=0")' в переменную "АдресКолонкиНовойЯчейки"
	И в табличном документе "РеквизитТабличныйДокумент" я перехожу к ячейке "$АдресСтрокиНовойЯчейки$$АдресКолонкиНовойЯчейки$"

@ТипШага: UI.Табличный документ.Переход к ячейке
@Описание: Позволяет переместиться в табличном документе на нужное количество ячеек вверх относительно текущей ячейки
@ПримерИспользования: И в табличном документе "ТабличныйДокумент" я перехожу на "5" ячеек вверх

Сценарий: В табличном документе "РеквизитТабличныйДокумент" я перехожу на "ЧислоЯчеек" ячеек вверх
	И я запоминаю адрес текущей ячейки "РеквизитТабличныйДокумент" в переменную "АдресТекущейЯчейки"
	И я запоминаю значение выражения 'СтрНайти($АдресТекущейЯчейки$, "C")' в переменную "ПозицияСимволаКолонки"
	И я запоминаю значение выражения '"R" + Формат(Число(Сред($АдресТекущейЯчейки$, 2, $ПозицияСимволаКолонки$ - 2)) - [ЧислоЯчеек],"ЧГ=0")' в переменную "АдресСтрокиНовойЯчейки"
	И я запоминаю значение выражения '"C" + Сред($АдресТекущейЯчейки$, $ПозицияСимволаКолонки$ + 1)' в переменную "АдресКолонкиНовойЯчейки"
	И в табличном документе "РеквизитТабличныйДокумент" я перехожу к ячейке "$АдресСтрокиНовойЯчейки$$АдресКолонкиНовойЯчейки$"

@ТипШага: UI.Табличный документ.Переход к ячейке
@Описание: Позволяет переместиться в табличном документе на нужное количество ячеек вниз относительно текущей ячейки
@ПримерИспользования: И в табличном документе "ТабличныйДокумент" я перехожу на "5" ячеек вниз

Сценарий: В табличном документе "РеквизитТабличныйДокумент" я перехожу на "ЧислоЯчеек" ячеек вниз
	И я запоминаю адрес текущей ячейки "РеквизитТабличныйДокумент" в переменную "АдресТекущейЯчейки"
	И я запоминаю значение выражения 'СтрНайти($АдресТекущейЯчейки$, "C")' в переменную "ПозицияСимволаКолонки"
	И я запоминаю значение выражения '"R" + Формат(Число(Сред($АдресТекущейЯчейки$, 2, $ПозицияСимволаКолонки$ - 2)) + [ЧислоЯчеек],"ЧГ=0")' в переменную "АдресСтрокиНовойЯчейки"
	И я запоминаю значение выражения '"C" + Сред($АдресТекущейЯчейки$, $ПозицияСимволаКолонки$ + 1)' в переменную "АдресКолонкиНовойЯчейки"
	И в табличном документе "РеквизитТабличныйДокумент" я перехожу к ячейке "$АдресСтрокиНовойЯчейки$$АдресКолонкиНовойЯчейки$"