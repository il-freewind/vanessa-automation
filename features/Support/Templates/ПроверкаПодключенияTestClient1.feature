﻿# language: ru
# encoding: utf-8
#parent uf:
@UF9_Вспомогательные_фичи
#parent ua:
@UA26_Макеты_для_проверки_test_client

@IgnoreOnCIMainBuild


Функциональность: Проверка подключение TestClient

	
Сценарий: Проверка подключение TestClient
	Когда в базе есть пользователь "Пользователь1" с паролем "1"
	И я устанавливаю настройку Vanessa Automation "ТаймаутЗапуска1С" 120
	
#	И    в базе есть пользователь "Пользователь2" с паролем "2"

	И я подключаю TestClient "Кладовщик" логин "Пользователь1" пароль "1"