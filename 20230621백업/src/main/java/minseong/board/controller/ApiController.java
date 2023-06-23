package minseong.board.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class ApiController {
    
    @GetMapping("/predict/{data}")
    public String getPrediction(@PathVariable String data) {
        // Flask로 데이터 전송
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:5000/predict/" + data;
        String response = restTemplate.getForObject(url, String.class);
        
        // Flask에서 받은 응답 반환
        return response;
    }
}
