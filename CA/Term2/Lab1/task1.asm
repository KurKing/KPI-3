TITLE ЛР_1 
;------------------------------------------------------------------------------
;ЛР  №1.1
;------------------------------------------------------------------------------
; Програмування 3. Системне програмування
; Завдання: Основи розробки і налагодження
; ВУЗ: КНУУ "КПІ"
; Факультет: ФІОТ
; Курс: 1
; Група: ІТ-01
;------------------------------------------------------------------------------
; Автори: Бардін В., Задніпрянець А., Куркін О.
; Дата: 10.09.2021
;---------------------------------
				;I.ЗАГОЛОВОК ПРОГРАМИ
IDEAL			; Директива - тип Асемблера tasm 
MODEL small		; Директива - тип моделі пам’яті 
STACK 256		; Директива - розмір стеку 
				;II.МАКРОСИ
				;III.ПОЧАТОК СЕГ arr_rnd1МЕНТУ ДАНИХ
DATASEG
exCode db 0
message1 db "Bardin",10,13,'$'
message2 db "Zadnipryanets",10,13,'$'
message3 db "Kurkin",10,13,'$'; Рядок символів для виводу на екран
				;VI. ПОЧАТОК СЕГМЕНТУ КОДУ
CODESEG
Start:
;--------------------------------- 1. Ініціалізація DS и ES---------------------------------------
	mov ax,@data; @data ідентифікатор, що створюються директивою model
	mov ds, ax	; Завантаження початку сегменту даних в регістр ds
	mov es, ax	; Завантаження початку сегменту даних в регістр es
;----------------------------------2. Операція виводу на консоль---------------------------------
                ; Завантаження числа 09h до регістру ah
                ; (Функція DOS 9h - команда виводу на консоль рядка)
	mov ah,09h

				; Пересилання адреси рядка символів message в регістр dx
	mov dx, offset message1
	int 21h		; Виклик функції DOS 9h

				; Пересилання адреси рядка символів message в регістр dx
	mov dx, offset message2
	int 21h		; Виклик функції DOS 9h

				; Пересилання адреси рядка символів message в регістр dx
	mov dx, offset message3
    int 21h		; Виклик функції DOS 9h
	
;----------------------------------3. Операція зупинки програми, очікування натискання клавіш-----
	mov ah,01h
                ; Завантаження числа 01h до регістру ah
                ; (Функція DOS 1h - команда очікування натискання клавіші...)
	int 21h		; Виклик функції DOS 1h
                ; Завантаження числа 4ch до регістру ah
                ; (Функція DOS 4ch - виходу з програми)
;---------------------------------4. Вихід з програми---------------------------------------------
	mov ah,4ch
	mov al,[exCode]	; отримання коду виходу 
	int 21h		    ; виклик функції DOS 4ch
	end Start
  
DOS 4ch
	end Start
