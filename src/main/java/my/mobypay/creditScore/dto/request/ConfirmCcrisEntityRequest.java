package my.mobypay.creditScore.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JacksonXmlRootElement(localName = "request")
public class ConfirmCcrisEntityRequest implements IRequest{

    @JsonProperty("ProductType")
    private String ProductType;
    @JsonProperty("CRefId")
    private String CRefId;
    @JsonProperty("EntityKey")
    private String EntityKey;
    @JsonProperty("MobileNo")
    private String MobileNo;
    @JsonProperty("EmailAddress")
    private String EmailAddress;
    @JsonProperty("LastKnownAddress")
    private String LastKnownAddress;
    @JsonProperty("ConsentGranted")
    private String ConsentGranted;
    @JsonProperty("EnquiryPurpose")
    private String EnquiryPurpose;
    @JsonProperty("Ref1")
    private String Ref1;
    @JsonProperty("Ref2")
    private String Ref2;
    @JsonProperty("Ref3")
    private String Ref3;
    @JsonProperty("Ref4")
    private String Ref4;
}
