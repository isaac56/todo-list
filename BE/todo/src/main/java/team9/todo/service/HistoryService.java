package team9.todo.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team9.todo.domain.DTO.History.ResponseDTO;
import team9.todo.domain.HistoryWithCardTitle;
import team9.todo.domain.User;
import team9.todo.repository.HistoryRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class HistoryService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final HistoryRepository historyRepository;

    @Autowired
    public HistoryService(HistoryRepository historyRepository) {
        this.historyRepository = historyRepository;
    }

    public List<ResponseDTO> getHistoryOfUser(User user) {
        logger.debug("history 목록 요청");
        List<HistoryWithCardTitle> historyList = historyRepository.findAllByUserId(user.getId());

        return historyList.stream().map(ResponseDTO::of).collect(Collectors.toList());
    }
}
