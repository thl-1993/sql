- **ex00** — Демонстрация транзакции: изменения видны только после `COMMIT`.
- **ex01** — Воспроизведение аномалии "потерянного обновления" на уровне `READ COMMITTED`.
- **ex02** — Проверка аномалии "потерянного обновления" при `REPEATABLE READ`.
- **ex03** — Воспроизведение аномалии "неповторяемого чтения" при `READ COMMITTED`.
- **ex04** — Проверка "неповторяемого чтения" на уровне `SERIALIZABLE`.
- **ex05** — Воспроизведение аномалии "фантомного чтения" при `READ COMMITTED`.
- **ex06** — Проверка "фантомного чтения" при `REPEATABLE READ`.
- **ex07** — Воспроизведение взаимоблокировки (Deadlock) между двумя транзакциями.

## Структура проекта

```
ex00/
ex01/
ex02/
ex03/
ex04/
ex05/
ex06/
ex07/
README.md
```