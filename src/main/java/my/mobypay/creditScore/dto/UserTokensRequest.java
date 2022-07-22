package my.mobypay.creditScore.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserTokensRequest {
    private String token1;
    private String token2;
}
