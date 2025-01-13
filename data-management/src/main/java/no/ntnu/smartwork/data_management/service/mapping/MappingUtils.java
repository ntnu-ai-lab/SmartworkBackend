/**
 * Author: Anuja Vats
 */

package no.ntnu.smartwork.data_management.service.mapping;

import java.time.Year;
import java.util.*;

public class MappingUtils {
    public static TreeMap mapPatientDetails(TreeMap originalPatientJson){

        TreeMap mappedPatientDetails = new TreeMap<>(originalPatientJson);

        performInitialMapping(originalPatientJson, mappedPatientDetails);

        // age_1
        mapAge_1(originalPatientJson, mappedPatientDetails);

        // bmi_1
        mapBmi_1(originalPatientJson, mappedPatientDetails);

        // como_count_1
        mapComoCount_1(originalPatientJson, mappedPatientDetails);

        // como_count_1
        mapEmploy_1(originalPatientJson, mappedPatientDetails);

        // como_count_1
        mapMsktRisk_1(originalPatientJson, mappedPatientDetails);

        // DuplicateVariables : pain_last_week_1=oreb_q2_1, pain_duration=oreb_q1_1.
        mapDuplicateVariables(mappedPatientDetails);

        cleanDataforNumbers(originalPatientJson, mappedPatientDetails);

        mappedPatientDetails.put("resources", new ArrayList<>());

        return mappedPatientDetails;
    }

    private static void mapMsktRisk_1(TreeMap originalPatientJson, TreeMap mappedPatientDetails) {
        String val = "";

        if(originalPatientJson.containsKey("mskt_score_1")) {
            int score = NumberExtractor.getInt(originalPatientJson.get("mskt_score_1").toString());

            if (0<= score && score <= 4)
                val = "low";
            if (5<= score && score <= 8)
                val = "medium";
            if (9<= score && score <= 12)
                val = "high";
        }

        mappedPatientDetails.put("mskt_risk_1", val);
    }

    public static void cleanDataforNumbers(TreeMap originalPatientJson, TreeMap mappedPatientDetails) {
        List<String> variables = Arrays.asList(
                "weight_1",
                "height_1",
                "employ_paidp_1",
                "employ_paidp_3",
                "employ_sickp_1",
                "employ_sickp_3",
                "employ_disabilityp_1",
                "employ_disabilityp_3");

        for (String key: variables){
            if(originalPatientJson.containsKey(key)) {
                int val = NumberExtractor.getInt(originalPatientJson.get(key).toString());

                if (originalPatientJson.get(key).toString().equals("-1"))
                    mappedPatientDetails.put(key, -1);
                else
                    mappedPatientDetails.put(key, val);
            }
        }
    }

    private static void performInitialMapping(TreeMap originalPatientJson, TreeMap mappedPatientDetails) {
        TreeMap<String, Map<String, String>> variableMap = CaseMappingJson.getCaseMappingJson();

        Set<String> varSet = variableMap.keySet();

        for ( String var: varSet) {
            if (originalPatientJson.containsKey(var)) {
                String oldVal = originalPatientJson.get(var).toString();

                Map<String, String> valueMap = variableMap.get(var);

                if (valueMap.containsKey(oldVal)) {
                    String newVal = valueMap.get(oldVal);
                    mappedPatientDetails.put(var, newVal);
                }
            }
        }
    }

    private static void mapAge_1(TreeMap originalPatientJson, TreeMap mappedPatientDetails){
        // birth_year
        String key = "age_1";
        int val = 0;

        if(originalPatientJson.containsKey("birth_year")) {
            int origVal = NumberExtractor.getInt(originalPatientJson.get("birth_year").toString());
            int currentYear = Year.now().getValue();
            mappedPatientDetails.put(key, (currentYear - origVal));
        }
    }

    private static void mapBmi_1(TreeMap originalPatientJson, TreeMap mappedPatientDetails){
        // bmi_1
        String key = "bmi_1";
        float bmi = 0;

        if(originalPatientJson.containsKey("weight_1") && originalPatientJson.containsKey("height_1")) {
            float height = (float) NumberExtractor.getInt(originalPatientJson.get("height_1").toString()) / 100;
            int weight = NumberExtractor.getInt(originalPatientJson.get("weight_1").toString());

            if ( height > 0)
                bmi = weight / (height * height);

            mappedPatientDetails.put("height_1", height);
        }

        mappedPatientDetails.put(key, bmi);
    }

    private static void mapComoCount_1( TreeMap originalPatientJson, TreeMap mappedPatientDetails){
        // como_count_1
        List<String> comobList = Arrays.asList("como_ra_1", "como_heart_1", "como_asthma_1", "como_neuro_1",
                "como_cancer_1", "como_psych_1", "como_dementhia_1", "como_osteoporosis_1", "como_diabetes_1",
                "como_stomach_pain_1", "como_headache_1", "como_fatigue_1", "como_other_1");

        int comoCount = 0;

        for (String key: comobList) {
            if(originalPatientJson.containsKey(key) && ((boolean)originalPatientJson.get(key))){
                ++comoCount;
            }
        }

        if (0 == comoCount)
            mappedPatientDetails.put("comorbidity_count_1", "0 comorbidity");
        if (1 == comoCount)
            mappedPatientDetails.put("comorbidity_count_1", "1 comorbidity");
        if (2<= comoCount && comoCount <= 3)
            mappedPatientDetails.put("comorbidity_count_1", "2 to 3 comorbidities");
        if (4 <= comoCount)
            mappedPatientDetails.put("comorbidity_count_1", "4 or more comorbidities");

        mappedPatientDetails.put("como_count_1", comoCount);
    }

    private static void mapEmploy_1( TreeMap originalPatientJson, TreeMap mappedPatientDetails){
        String employ_1 = "";
        /*
        working or other = {employ_paid_1, employ_stud_1, employ_retired_1, employ_unpaid_1, employ_unempl_1, employ_parentleave_1}
        disability pension or work assessment = {employ_disability_1 and employ_assess_1}
        sick leave = {employ_sick_1)
         */
        List<String> workingOrOtherList = Arrays.asList("employ_paid_1", "employ_stud_1", "employ_retired_1",
                "employ_unpaid_1", "employ_unempl_1", "employ_parentleave_1");
        List<String> disabilityPensionOrWorkAssessmentList = Arrays.asList("employ_disability_1", "employ_assess_1");
        String sickLeave = "employ_sick_1";

        for (String key: workingOrOtherList) {
            if (originalPatientJson.containsKey(key) && ((boolean) originalPatientJson.get(key))) {
                employ_1 = "working or other";
                break;
            }
        }

        for (String key: disabilityPensionOrWorkAssessmentList) {
            if (originalPatientJson.containsKey(key) && ((boolean) originalPatientJson.get(key))) {
                employ_1 = "disability pension or work assessment";
                break;
            }
        }

        if (originalPatientJson.containsKey("employ_sick_1") && ((boolean) originalPatientJson.get("employ_sick_1")))
            employ_1 = "sick leave";

        mappedPatientDetails.put("employ_1", employ_1);
    }

    private static void mapDuplicateVariables(TreeMap mappedPatientDetails){
        // DuplicateVariables :
        // pain_duration_1 = oreb_q1_1
        // pain_lweek_1 = oreb_q2_1,

        if (mappedPatientDetails.containsKey("oreb_q1_1")) {
            String oreb_q1_1_val = mappedPatientDetails.get("oreb_q1_1").toString();

            List<String> lt1m = Arrays.asList("0 to 1 week", "1 to 2 weeks", "3 to 4 weeks");
            List<String> oneTo3m = Arrays.asList("4 to 5 weeks", "6 to 8 weeks", "9 to 11 weeks");
            List<String> threeTo6m = Arrays.asList("3 to 6 months");
            List<String> sixTo12m = Arrays.asList("6 to 9 months", "9 to 12 months");
            List<String> mt12m = Arrays.asList("more than 12 months");

            String mappingVal = "";

            if (lt1m.contains(oreb_q1_1_val))
                mappingVal = "less than 1 month";
            else if (oneTo3m.contains(oreb_q1_1_val))
                mappingVal = "1 to 3 months";
            else if (threeTo6m.contains(oreb_q1_1_val))
                mappingVal = "3 to 6 months";
            else if (sixTo12m.contains(oreb_q1_1_val))
                mappingVal = "6 to 12 months";
            else if (mt12m.contains(oreb_q1_1_val))
                mappingVal = "more than 12 months";

            mappedPatientDetails.put("pain_duration_1", mappingVal);
        }

        if (mappedPatientDetails.containsKey("oreb_q2_1")) {
            mappedPatientDetails.put("pain_last_week_1", (int) mappedPatientDetails.get("oreb_q2_1"));
        }
    }

    private int getLcaClass(){

        return 0;
    }
}
