﻿# language: ru
# encoding: utf-8
#parent uf:
@UF9_Вспомогательные_фичи
#parent ua:
@UA30_Прочие_макеты

@IgnoreOnCIMainBuild
@tree

Функционал: Проверка многострочных параметров FeatureReader




Сценарий: Проверка многострочных параметров
		И шаг VA принимающий три многострочные строки
		"""
			1
			2
			3
		"""	

		"""
			11
			22
			33
		"""	

		"""
			111
			222
			333
		"""	

