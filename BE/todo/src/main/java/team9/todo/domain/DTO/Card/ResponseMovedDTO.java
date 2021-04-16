package team9.todo.domain.DTO.Card;

import team9.todo.domain.Card;
import team9.todo.domain.enums.CardColumn;

public class ResponseMovedDTO extends ResponseDTO {
    private boolean rebalanced;

    private ResponseMovedDTO(Long id, String title, String content, double priority, CardColumn columnType, boolean deleted, boolean rebalanced) {
        super(id, title, content, priority, columnType, deleted);
        this.rebalanced = rebalanced; // 클라이언트에서 true 일때 카드목록을 전체 다 불러와야함.
    }

    public static ResponseMovedDTO of(Card entity, boolean rebalanced) {
        return new ResponseMovedDTO(entity.getId(), entity.getTitle(),
                entity.getContent(), entity.getPriority(),
                entity.getColumnType(), entity.isDeleted(), rebalanced);
    }

    public boolean isRebalanced() {
        return rebalanced;
    }
}
