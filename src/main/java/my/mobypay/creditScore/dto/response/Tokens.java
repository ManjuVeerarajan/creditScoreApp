package my.mobypay.creditScore.dto.response;

import lombok.Data;

@Data
public class Tokens {

    private String token1;
    private String token2;
    private String error;
   	private String code;
   	private String dataBaseMessage;

}
