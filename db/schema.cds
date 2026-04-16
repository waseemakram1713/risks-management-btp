namespace RiskManagement;

// 1. Reference the imported Business Partner API
// Note: Ensure the path points to your srv/external folder
using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER';

entity Risks
{
    key ID : UUID;
    title : String(100);
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    miti : Association to one Mitigations;
    // 2. Add the supplier relationship (Association to-one)
    supplier : Association to one external.A_BusinessPartner;
}

entity Mitigations
{
    key ID : UUID;
    createdAt : String(100);
    createdBy : String(100);
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.miti = $self;
}