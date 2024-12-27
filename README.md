# Благодарности
Большое спасибо пользователям интернета, форумов и других мест, за то что помогли мне понять как собрать домашний сервер на HP EliteDesk G3 800 Mini, ОС Ubuntu с поддержкой ускорителя Coral AI EdgeTPU. Домашний сервер выполняет роль HomeAssistant, Frigate NVR.
Поэтому я написал этот опус, чтобы другие смогли бы не набивая шишки развернуть у себя подобную систему.

## Github

https://github.com/geerlingguy
https://github.com/home-assistant
https://github.com/blakeblackshear/frigate
https://github.com/magic-blue-smoke
https://github.com/vmware-samples/packer-examples-for-vsphere/tree/develop

## Youtube

https://www.youtube.com/@HardwareHaven
https://www.youtube.com/@apalrdsadventures
https://www.youtube.com/watch?v=DmbFq5dMsFo&t=1s

# Disclaimer

Автор не несет ответственности за точность, полноту или качество предоставленной информации. Никакие претензии за материальный или нематериальный ущерб, вызванный использованием или неиспользованием предоставленной информации либо использованием неверной или неполной информации, не принимаются, если этот ущерб не был явным следствием небрежности или преступного умысла автора. Все предложения выдвигаются без каких-либо обязательств. Автор оставляет за собой право изменять, удалять или дополнять содержимое веб-сайта без предварительного уведомления, а также удалять публикации в Интернете временно или навсегда.

# Предыстория

Есть пару частных домов, где я хотел бы поставить систему видеонаблюдения. с удаленным доступом и более простым входом в систему удаленно.

Также в квартире установлен Home Assistant. Который постепенно развивался из системы на базе Raspberry в полноценный x86 домашний сервер.

Но последние 4 года выдались очень трудными и многие вопросы я просто отправил в Backlog. Доставая оттуда по возможности, но всегда и везде и не в полном объеме.

Летом 2022 года удалось раздобыть старый регистратор, прикупить несколько камер и в одном частном доме провести инженерные работы и установить камеры, подключить к видеорегистратору. Регистратор был 8 канальный коаксиальный. В онлайн регистратор не умел, но мне с домашнего компьютера удалось из VLC смотреть видео по RTSP.

Кажется, тогда же я узнал, что есть Frigate NVR, который может получать RTSP сигнал и имеет интеграцию с HomeAssistant. Также в самом Frigate NVR есть много функционала, который меня подкупил.

На Youtube каналах я узнал, что в 2022-2023 годах лучшим решением для будет БУ HP EliteDesk G3 800 Mini, который на ebay продается в комплекте за 50-70 долларов США. Отличная рекомендация подумал я и купил себе две штуки, с доставкой вышло в районе 100 долларов США за каждый компьютер в Алматы. Конфигурация была - Intel i3 8100/16GB RAM. На Amazon купил пару SSD 2.5 1TB TeamGroup, это была самая дешевая цена, я на них не сильно рассчитываю, но я уже купил 4 таких диска и они отлично работают.

В 2022 году узнал о Google Coral AI EdgeTPU adapter - ускоритель тензорных (вот бы еще вспомнить что это такое из курса Алгебры с мехмата.) вычислений. Маленькая плата, на сайте несколько разных видов. Я выбрал [Dual EdgeTPU](https://coral.ai/products/m2-accelerator-dual-edgetpu/) , но они продавались только на немецком сайте, купил 2 штуки (это было в декабре 2022) и по какой-то причине на таможне Германии их завернули, я уже подумал что все сгорели деньги, на Ebay купил еще 2, эти из США приехали быстро. Но через месяц другой (кажется февраль 2023) позвонили с почты, попросили забрать посылку из Германии. Таким образом у меня оказалось 4 платы.

Имея в руках компьютер, SSD диски и EdgeTPU, я собрал компьютер, в слот m.2 WIFI воткнул плату и начал устанавливать по имеющимся в интернете мануалам Ubuntu. 

Но у меня не получилось. Не получалось в течение года. Я думал, что возможно я что-то делаю неправильно. Ставил Ubuntu, Debian, Rocky Linux, с поддержкой UEFI и без, с включенным SecureBoot и без. Все это делал вечером после работы, раз в неделю или реже.

Задавал вопросы на форумах, на Youtube - нет удачи. Но однажды я еще раз прочитал [тред](https://github.com/google-coral/edgetpu/issues/256#issuecomment-2499805291) и понял, что дело в моем компьютере, в слот m.2 WIFI можно поставить WIFI. Там же предложили решение - купить [эту плату](https://www.amazon.com/gp/product/B079NB8J3B/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1), на нее установить адаптер и установить в слот m.2 nvme.

Купил плату, получил плату, установил в компьютере и чудо - плата EdgeTPU появилась в Ubuntu прямо с первого раза. Но оказалось, что плата Dual EdgeTPU, в системе определяется только 1 EdgeTPU, а второй не видит.

Но и эта проблема тоже решаемая, один [разработчик](https://github.com/magic-blue-smoke) столкнулся с этой проблемой, понял в чем дело, разработал [несколько плат](https://github.com/magic-blue-smoke/Dual-Edge-TPU-Adapter). **Мое уважение!!**

Уже в 2024 году я купил себе 2 платы [Low profile PCIe x1 version](https://www.makerfabs.com/dual-edge-tpu-adapter.html) и 2 платы [m.2 BM version](https://www.makerfabs.com/dual-edge-tpu-adapter-m2-2280-b-m-key.html). Платы пришли и я установил в свои компьютеры, есть доступ к обоим EdgeTPU.

В плане ОС я решил не слишком себе усложнять жизнь себе и будущим пользователям этих сервисов и решил установить ОС Ubuntu, на Docker поднять Home Assistant, Frigate NVR в рамках одного docker-compose.yaml. Так у них будет общая сеть и интеграция будет проще.

 Я не стал использовать системы виртуализации, это лишний слой абстракции.

Но ведь настроить ручками каждый раз каждый новый компьютер - это не чем гордится Lead DevOps Engineer. Поэтому решил уделить этому вопросу больше времени и автоматизировать процесс. Будем использовать packer, ansible.

[Packer](https://developer.hashicorp.com/packer/install) использовать буду из-за готового [репозитория](https://github.com/vmware-samples/packer-examples-for-vsphere/tree/develop), которым я использовал для работы на прошлой работе и я очень доволен им.
Весь репозитории мне не нужен, я взял только часть репозитория, которая генерирует шаблон cloud-init autoinstall для Ubuntu 22.04. Две части нужны для генерации сетевой конфигурации и хранилища данных. Авторы репозитория используют  [шаблон нарезки жесткого диска](https://github.com/vmware-samples/packer-examples-for-vsphere/blob/develop/tests/storage/test-lvm.pkrvars.hcl). Я же добавил еще пару logical volume lv
 
# Hardware

# Software

## Ubuntu

## Ansible

A small repository to install Ubuntu 22.04 on HP EliteDesk G3 800 Mini, install Docker, Frigate NVR, Homeassistant, Google Coral AI EdgeTPU

Links
- https://www.pugetsystems.com/labs/hpc/ubuntu-22-04-server-autoinstall-iso/
- https://github.com/vmware-samples/packer-examples-for-vsphere/tree/main/builds


