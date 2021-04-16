package team9.todo.service;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import team9.todo.domain.DTO.Card.ResponseDTO;
import team9.todo.domain.DTO.Card.ResponseMovedDTO;
import team9.todo.domain.User;
import team9.todo.domain.enums.CardColumn;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
class CardServiceTest {
    private CardService cardService;

    @Autowired
    public CardServiceTest(CardService cardService) {
        this.cardService = cardService;
    }
    
    @Test
    @DisplayName("shuffle test")
    void move() {
        User user = new User("test", "1234");
        user.setId(1L);
        for (int i = 0; i < 1000; i++) {
            System.err.println("cycle: " + i);
            shuffleOneCycle(user);
        }
    }

    private void shuffleOneCycle(User user) {
        ResponseMovedDTO responseMovedDTO = cardService.move(3L, 1L, 2L, CardColumn.TODO, user);
        System.err.println("priority: " + responseMovedDTO.getPriority());
        List<ResponseDTO> cards = cardService.getList(CardColumn.TODO, user);
        Assertions.assertAll(
                () -> assertThat(cards.get(0).getId()).isEqualTo(1L),
                () -> assertThat(cards.get(1).getId()).isEqualTo(3L),
                () -> assertThat(cards.get(2).getId()).isEqualTo(2L)
        );
        responseMovedDTO = cardService.move(1L, 3L, 2L, CardColumn.TODO, user);
        System.err.println("priority: " + responseMovedDTO.getPriority());
        List<ResponseDTO> cards2 = cardService.getList(CardColumn.TODO, user);
        Assertions.assertAll(
                () -> assertThat(cards2.get(0).getId()).isEqualTo(3L),
                () -> assertThat(cards2.get(1).getId()).isEqualTo(1L),
                () -> assertThat(cards2.get(2).getId()).isEqualTo(2L)
        );
    }
}
