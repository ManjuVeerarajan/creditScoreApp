package my.mobypay.creditScore.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class Item {
    @JsonProperty("CRefId")
    private String CRefId;
    @JsonProperty("EntityKey")
    private String EntityKey;
    @JsonProperty("EntityId")
    private String EntityId;
    @JsonProperty("EntityId2")
    private String EntityId2;
    @JsonProperty("EntityName")
    private String EntityName;
    @JsonProperty("EntityDOBDOC")
    private String EntityDOBDOC;
    @JsonProperty("EntityGroupCode")
    private String EntityGroupCode;
    @JsonProperty("EntityState")
    private String EntityState;
    @JsonProperty("EntityNationality")
    private String EntityNationality;
    @JsonProperty("CcrisNote")
    private String CcrisNote;

}
