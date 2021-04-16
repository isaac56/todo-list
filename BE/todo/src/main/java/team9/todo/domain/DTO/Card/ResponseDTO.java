package team9.todo.domain.DTO.Card;

import team9.todo.domain.Card;
import team9.todo.domain.enums.CardColumn;

public class ResponseDTO {
    private Long id;

    private String title;

    private String content;

    private double priority;

    private int columnType;

    private boolean deleted;

    private ResponseDTO(Long id, String title, String content, double priority, CardColumn columnType, boolean deleted) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.priority = priority;
        this.columnType = columnType.ordinal();
        this.deleted = deleted;
    }

    public static ResponseDTO of(Card entity) {
        return new ResponseDTO(entity.getId(), entity.getTitle(),
                entity.getContent(), entity.getPriority(),
                entity.getColumnType(), entity.isDeleted());
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public double getPriority() {
        return priority;
    }

    public int getColumnType() {
        return columnType;
    }

    public boolean isDeleted() {
        return deleted;
    }
}
