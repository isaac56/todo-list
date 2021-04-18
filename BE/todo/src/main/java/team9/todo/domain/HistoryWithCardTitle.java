package team9.todo.domain;

import team9.todo.domain.enums.CardColumn;
import team9.todo.domain.enums.HistoryAction;

import java.time.LocalDateTime;

public class HistoryWithCardTitle {

    private final String cardTitle;
    private final HistoryAction action;
    private final LocalDateTime date;
    private final CardColumn from;
    private final CardColumn to;

    public HistoryWithCardTitle(String cardTitle, HistoryAction action, LocalDateTime date, CardColumn from, CardColumn to) {
        this.cardTitle = cardTitle;
        this.action = action;
        this.date = date;
        this.from = from;
        this.to = to;
    }

    public String getCardTitle() {
        return cardTitle;
    }

    public HistoryAction getAction() {
        return action;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public CardColumn getFrom() {
        return from;
    }

    public CardColumn getTo() {
        return to;
    }
}
