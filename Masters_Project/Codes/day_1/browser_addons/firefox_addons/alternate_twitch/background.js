'use strict';

browser.runtime.onMessage.addListener((оСообщение, оОтправитель, фОтветить) =>
{
	if (оСообщение.сЗапрос === 'ЗапуститьПроигрыватель' && оОтправитель.frameId === 0)
	{
		const оОбновить =
		{
			url: `${browser.extension.getURL('player.html')}${оСообщение.сАдрес}`
		};
		// Firefox 52 не выполнит update(), если найдет в оОбновить неизвестное свойство.
		if (оСообщение.лЗаменить)
		{
			оОбновить.loadReplace = true;
		}
		browser.tabs.update(оОтправитель.tab.id, оОбновить);
	}
});

browser.runtime.onUpdateAvailable.addListener(() =>
// Отложить обновление расширения до закрытия всех его страниц, кроме фоновой.
// Алгоритм рассчитан на работу c persisted: true в manifest.json.
// Firefox 62: persistent: false не поддерживается.
// Chrome 69: persistent: false не совместим с webRequest, даже если тот вызывается не в фоновой странице.
// Firefox 62: getViews() не видит приватные вкладки. Chrome 69 поступает также (см. обработчик onUpdateAvailable в player.js).
{
	browser.tabs.onUpdated.addListener(ОбработатьUpdated);
	browser.tabs.onRemoved.addListener(ОбновитьРасширение);
	ОбновитьРасширение();
});

function ОбработатьUpdated(чИдВкладки, оИзменения)
{
	// Firefox 62: Во время 'loading' окна нет в getViews().
	if (оИзменения.status === 'complete')
	{
		ОбновитьРасширение();
	}
}

function ОбновитьРасширение()
{
	if (browser.extension.getViews().length < 2)
	{
		browser.runtime.reload();
	}
}
