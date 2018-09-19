//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.4-2 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2017.09.06 at 02:40:54 PM EDT 
//


package com.trustiphi.tpm2verification.platformcertparse;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for XmlCertificatePolicies complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="XmlCertificatePolicies">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="policyIdentifier" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="policyQualifier" type="{www.trustiphi.com/platfromcertificateparser}XmlPolicyQualifier" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "XmlCertificatePolicies", propOrder = {
    "policyIdentifier",
    "policyQualifier"
})
public class XmlCertificatePolicies {

    @XmlElement(required = true)
    protected String policyIdentifier;
    protected List<XmlPolicyQualifier> policyQualifier;

    /**
     * Gets the value of the policyIdentifier property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPolicyIdentifier() {
        return policyIdentifier;
    }

    /**
     * Sets the value of the policyIdentifier property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPolicyIdentifier(String value) {
        this.policyIdentifier = value;
    }

    /**
     * Gets the value of the policyQualifier property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the policyQualifier property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getPolicyQualifier().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link XmlPolicyQualifier }
     * 
     * 
     */
    public List<XmlPolicyQualifier> getPolicyQualifier() {
        if (policyQualifier == null) {
            policyQualifier = new ArrayList<XmlPolicyQualifier>();
        }
        return this.policyQualifier;
    }

}