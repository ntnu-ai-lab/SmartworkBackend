<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" version="1.0"/>

    <xsl:template match="/">
        <patient>

            <projectId><xsl:value-of select="forms/@projectnumber"/></projectId>
            <taskId>249961490</taskId>
            <taskName>SupportPRIM - Baseline Pasient</taskName>
            <clinicName><xsl:value-of select="forms/form/patient/@medicalOffice"/></clinicName>
            <journalId><xsl:value-of select="forms/form/patient/@journalId"/></journalId>
            <birthYear><xsl:value-of select="forms/form/patient/@birthYear"/></birthYear>

            <!--Get the star date and time-->
            <xsl:for-each select="//form">
                <xsl:if test="@Name = 'Bakgrunnsdata - supportPRIM'">
                    <startDate>                            <xsl:value-of select="substring-before(@start, ' ')"/>
                    </startDate>
                    <startTime>
                        <xsl:value-of select="substring-after(@start, ' ')"/>
                    </startTime>
                </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="//form/groups/group">
                <!-- Code for condition : 0  START ....................... -->


                <!-- Code for condition : 0  ......................... END -->


                <!-- Code for condition : 1  START ....................... -->


                <!-- Code for condition : 1  ......................... END -->


                <!-- Code for condition : 2  START ....................... -->

                <xsl:for-each select="question">
                    <xsl:if test="@name='Klinikk'">
                        <physio_id>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </physio_id>
                    </xsl:if>
                    <xsl:if test="@name='Pasient nr'">
                        <journal_id>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </journal_id>
                    </xsl:if>
                    <xsl:if test="@name='Fødselsår'">
                        <birth_year>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </birth_year>
                    </xsl:if>
                    <xsl:if test="@name='Hvordan vil du beskrive arbeidet ditt (lønnet eller ulønnet)?'">
                        <work_type_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </work_type_1>
                    </xsl:if>
                    <xsl:if test="@name='Arbeidsevne'">
                        <work_ability_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </work_ability_1>
                    </xsl:if>
                    <xsl:if test="@name='Når du tenker på barndommen/ oppveksten din vil du beskrive den som: '">
                        <childhood_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </childhood_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvor redusert er ditt daglige aktivitetsnivå på grunn av smerter eller plager?'">
                        <activity_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </activity_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvor engstelig er du for at dine plager forverres med fysisk aktivitet eller bevegelse?'">
                        <fear_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </fear_1>
                    </xsl:if>
                    <xsl:if test="@name='Spesifiser:'">
                        <treat12m_othersp_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </treat12m_othersp_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvor mange slike behandlinger har du hatt i løpet av de siste 12 måneder?'">
                        <treat12m_numb_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </treat12m_numb_1>
                    </xsl:if>
                    <xsl:if test="@name='Hva er din arbeidssituasjon nå? '">
                        <employ_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </employ_1>
                    </xsl:if>
                    <xsl:if test="@name='Høyde'">
                        <height_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </height_1>
                    </xsl:if>
                    <xsl:if test="@name='Vekt'">
                        <weight_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </weight_1>
                    </xsl:if>
                    <xsl:if test="@name='Røyker du?'">
                        <smoking_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </smoking_1>
                    </xsl:if>
                    <xsl:if test="@name='Ditt høyeste utdanningsnivå:'">
                        <education_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </education_1>
                    </xsl:if>
                    <xsl:if test="@name='Hva er høyeste utdanning?'">
                        <education_othersp_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </education_othersp_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvor er du født?'">
                        <ethnicity_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </ethnicity_1>
                    </xsl:if>
                    <xsl:if test="@name='Sivilstand'">
                        <marital_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </marital_1>
                    </xsl:if>
                    <xsl:if test="@name='Bosituasjon'">
                        <family_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </family_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvor mange barn under 18 år har du daglig omsorg for?'">
                        <family_child_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </family_child_1>
                    </xsl:if>
                    <xsl:if test="@name='Kjønn'">
                        <gender_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </gender_1>
                    </xsl:if>
                    <xsl:if test="@name='Bruker du ganghjelpemidler?'">
                        <walk_aid_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </walk_aid_1>
                    </xsl:if>
                    <xsl:if test="@name='Jeg tror at fysioterapi vil bedre min funksjon:'">
                        <treat_belief_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </treat_belief_1>
                    </xsl:if>
                    <xsl:if test="@name='Store nattsmerter?'">
                        <red_flag_nightpain_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </red_flag_nightpain_1>
                    </xsl:if>
                    <xsl:if test="@name='Tidligere kreftdiagnose?'">
                        <red_flag_cancer_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </red_flag_cancer_1>
                    </xsl:if>
                    <xsl:if test="@name='Uforklarlig vekttap dårlig matlyst uforklarlig feber?'">
                        <red_flag_weight_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </red_flag_weight_1>
                    </xsl:if>
                    <xsl:if test="@name='Problemer med vannlating avføring og/eller seksualfunksjon?'">
                        <red_flag_urination_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </red_flag_urination_1>
                    </xsl:if>
                    <xsl:if test="@name='Har du vanskelig for å forstå helseinformasjon som du mottar?'">
                        <health_lit_info_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </health_lit_info_1>
                    </xsl:if>
                    <xsl:if test="@name='Synes du at du har en god forståelse av din nåværende helsesituasjon (muligheter og begrensninger)?'">
                        <health_lit_sit_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </health_lit_sit_1>
                    </xsl:if>
                    <xsl:if test="@name='Gange'">
                        <eq5d_walk_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eq5d_walk_1>
                    </xsl:if>
                    <xsl:if test="@name='Personlig stell'">
                        <eq5d_care_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eq5d_care_1>
                    </xsl:if>
                    <xsl:if test="@name='Vanlige gjøremål '">
                        <eq5d_adl_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eq5d_adl_1>
                    </xsl:if>
                    <xsl:if test="@name='Smerter/ ubehag'">
                        <eq5d_pain_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eq5d_pain_1>
                    </xsl:if>
                    <xsl:if test="@name='Angst/ depresjon'">
                        <eq5d_depr_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eq5d_depr_1>
                    </xsl:if>
                    <xsl:if test="@name='Søvn'">
                        <qol15d_q5_sleep_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </qol15d_q5_sleep_1>
                    </xsl:if>
                    <xsl:if test="@name='Livskraft'">
                        <qol15d_q14_vital_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </qol15d_q14_vital_1>
                    </xsl:if>
                    <xsl:if test="@name='Örebro screening skjema - Fysioprim'">
                        <oreb_score_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_score_1>
                    </xsl:if>
                    <xsl:if test="@name='1. Hvor lenge har du hatt dine nåværende plager?'">
                        <oreb_q1_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q1_1>
                    </xsl:if>
                    <xsl:if test="@name='2. Hvor mye smerter har du hatt den SISTE UKEN?'">
                        <oreb_q2_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q2_1>
                    </xsl:if>
                    <xsl:if test="@name='3. Jeg kan utføre lettere arbeid under en time.'">
                        <oreb_q3_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q3_1>
                    </xsl:if>
                    <xsl:if test="@name='4. Jeg kan sove på natten.'">
                        <oreb_q4_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q4_1>
                    </xsl:if>
                    <xsl:if test="@name='5. Hvor anspent eller stresset har du kjent deg den SISTE UKEN?'">
                        <oreb_q5_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q5_1>
                    </xsl:if>
                    <xsl:if test="@name='6. I hvilken grad har du kjent deg nedstemt den SISTE UKEN?'">
                        <oreb_q6_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q6_1>
                    </xsl:if>
                    <xsl:if test="@name='7. Hvor stor risiko mener du det er for at dine nåværende plager kan bli langvarige?'">
                        <oreb_q7_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q7_1>
                    </xsl:if>
                    <xsl:if test="@name='8. Ut fra din vurdering hvor stor er sjansen for at du er i arbeid om TRE MÅNEDER?'">
                        <oreb_q8_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q8_1>
                    </xsl:if>
                    <xsl:if test="@name='9. Om plagene øker er det et signal på at jeg bør slutte med det jeg holder på med til plagene minker.'">
                        <oreb_q9_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q9_1>
                    </xsl:if>
                    <xsl:if test="@name='10. Jeg bør ikke utføre mine normale aktiviteter eller arbeid med den smerten jeg har nå.'">
                        <oreb_q10_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q10_1>
                    </xsl:if>
                    <xsl:if test="@name='Er smerten av varierende intensitet?'">
                        <pain_vary_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pain_vary_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvordan vil du beskrive smertevariasjonen best?'">
                        <pain_variation_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pain_variation_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvor ofte har du vanligvis disse smertene?'">
                        <pain_freq_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pain_freq_1>
                    </xsl:if>
                    <xsl:if test="@name='Har du brukt noen medisiner mot smerte i løpet av den siste uken?'">
                        <medic_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </medic_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvilke medisiner?'">
                        <medic_type>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </medic_type>
                    </xsl:if>
                    <xsl:if test="@name='Gjennomsnitt:'">
                        <hscl_score_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_score_1>
                    </xsl:if>
                    <xsl:if test="@name='1. Plutselig skremt uten grunn'">
                        <hscl_q1_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_q1_1>
                    </xsl:if>
                    <xsl:if test="@name='2. Føler du deg svimmel eller kraftesløs'">
                        <hscl_q2_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_q2_1>
                    </xsl:if>
                    <xsl:if test="@name='3. Føler deg anspent eller opphisset'">
                        <hscl_q3_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_q3_1>
                    </xsl:if>
                    <xsl:if test="@name='4. Anfall av redsel eller panikk'">
                        <hscl_q4_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_q4_1>
                    </xsl:if>
                    <xsl:if test="@name='5. Anklager deg selv for ting'">
                        <hscl_q5_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_q5_1>
                    </xsl:if>
                    <xsl:if test="@name='6. Vanskelig for å sove'">
                        <hscl_q6_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_q6_1>
                    </xsl:if>
                    <xsl:if test="@name='7. Følelse av håpløshet mhp. framtiden'">
                        <hscl_q7_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_q7_1>
                    </xsl:if>
                    <xsl:if test="@name='8. Føler deg nedfor'">
                        <hscl_q8_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_q8_1>
                    </xsl:if>
                    <xsl:if test="@name='9. Føler at alt krever stor anstrengelse'">
                        <hscl_q9_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_q9_1>
                    </xsl:if>
                    <xsl:if test="@name='10. Føler at du ikke er noe verd'">
                        <hscl_q10_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl_q10_1>
                    </xsl:if>
                    <xsl:if test="@name='Mosjon og Trening Fysioprim'">
                        <pa_sum_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pa_sum_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvor ofte driver du mosjon eller trening?'">
                        <pa_freq_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pa_freq_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvor hardt mosjonerer / trener du?'">
                        <pa_int_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pa_int_1>
                    </xsl:if>
                    <xsl:if test="@name='Hvor lenge holder du på hver gang?'">
                        <pa_dur_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pa_dur_1>
                    </xsl:if>
                    <xsl:if test="@name='Keele STarT MSK skjema© Selvrapporteringsversjon'">
                        <mskt_risk_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_risk_1>
                    </xsl:if>
                    <xsl:if test="@name='1) Hvor intense var smertene i gjennomsnitt (der 0 er ingen smerte&quot; og 10 er &quot;så vondt som det går an å ha&quot;)?&quot;'">
                        <mskt_q1_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_q1_1>
                    </xsl:if>
                    <xsl:if test="@name='2) Føler du deg ofte usikker på hvordan du skal håndtere smertene dine?'">
                        <mskt_q2_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_q2_1>
                    </xsl:if>
                    <xsl:if test="@name='3) Har smertene dine plaget deg mye de siste to ukene?'">
                        <mskt_q3_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_q3_1>
                    </xsl:if>
                    <xsl:if test="@name='4) Har du bare klart å gå korte avstander på grunn av smertene dine?'">
                        <mskt_q4_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_q4_1>
                    </xsl:if>
                    <xsl:if test="@name='5) Har du vært plaget med ledd- eller muskelsmerter flere steder i kroppen?'">
                        <mskt_q5_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_q5_1>
                    </xsl:if>
                    <xsl:if test="@name='6) Tror du plagene dine kommer til å vare lenge?'">
                        <mskt_q6_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_q6_1>
                    </xsl:if>
                    <xsl:if test="@name='7) Har du andre vesentlige helseplager?'">
                        <mskt_q7_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_q7_1>
                    </xsl:if>
                    <xsl:if test="@name='8) Har smertene gjort deg nedtrykt eller deprimert de siste to ukene?'">
                        <mskt_q8_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_q8_1>
                    </xsl:if>
                    <xsl:if test="@name='9) Føler du at det er utrygt for deg med din helsetilstand å være fysisk aktiv (f.eks. å gå løfte trene bøye seg)?'">
                        <mskt_q9_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_q9_1>
                    </xsl:if>
                    <xsl:if test="@name='10) Har du hatt dine nåværende smerteproblemer i 6 måneder eller lenger?'">
                        <mskt_q10_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskt_q10_1>
                    </xsl:if>
                    <xsl:if test="@name='SPØRRESKJEMA OM MUSKEL- OG SKJELETTHELSE (MSK-HQ)'">
                        <mskhq_score_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_score_1>
                    </xsl:if>
                    <xsl:if test="@name='1. Smerte/stivhet i løpet av dagen'">
                        <mskhq_q1_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q1_1>
                    </xsl:if>
                    <xsl:if test="@name='2. Smerter/stivhet om natten.'">
                        <mskhq_q2_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q2_1>
                    </xsl:if>
                    <xsl:if test="@name='3. Gange'">
                        <mskhq_q3_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q3_1>
                    </xsl:if>
                    <xsl:if test="@name='4. Vaske seg/påkledning'">
                        <mskhq_q4_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q4_1>
                    </xsl:if>
                    <xsl:if test="@name='5. Fysisk aktivitetsnivå'">
                        <mskhq_q5_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q5_1>
                    </xsl:if>
                    <xsl:if test="@name='6. Arbeid/daglige aktiviteter'">
                        <mskhq_q6_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q6_1>
                    </xsl:if>
                    <xsl:if test="@name='7. Sosiale aktiviteter og hobbyer'">
                        <mskhq_q7_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q7_1>
                    </xsl:if>
                    <xsl:if test="@name='8. Behov for hjelp'">
                        <mskhq_q8_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q8_1>
                    </xsl:if>
                    <xsl:if test="@name='9. Søvn'">
                        <mskhq_q9_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q9_1>
                    </xsl:if>
                    <xsl:if test="@name='10. Utmattelse eller lite energi '">
                        <mskhq_q10_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q10_1>
                    </xsl:if>
                    <xsl:if test="@name='11. Følelsesmessig velvære'">
                        <mskhq_q11_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q11_1>
                    </xsl:if>
                    <xsl:if test="@name='12. Forståelse av dine helseplager og pågående behandling'">
                        <mskhq_q12_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q12_1>
                    </xsl:if>
                    <xsl:if test="@name='13. Tro på å mestre symptomene dine'">
                        <mskhq_q13_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q13_1>
                    </xsl:if>
                    <xsl:if test="@name='14. Generell påvirkning'">
                        <mskhq_q14_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q14_1>
                    </xsl:if>
                    <xsl:if test="@name='Fysisk aktivitetsnivå'">
                        <mskhq_pa_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_pa_1>
                    </xsl:if>
                    <xsl:if test="@name='Pain Self-Efficacy Questionnaire (PSEQ-2)'">
                        <pseq_score_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_score_1>
                    </xsl:if>
                    <xsl:if test="@name='1. Jeg kan gjøre noen former for arbeid til tross for smerten (arbeid inkluderer husarbeid og lønnet/ulønnet arbeid)'">
                        <pseq_q1_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_q1_1>
                    </xsl:if>
                    <xsl:if test="@name='2. Jeg kan leve en normal livsstil til tross for smerten'">
                        <pseq_q2_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_q2_1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_act_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_act_1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_act_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_act_1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_act_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_act_1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_1>
                    </xsl:if>
                    <xsl:if test="@name='Hva er hovedmålet med behandlingen'">
                        <treat_goal_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </treat_goal_1>
                    </xsl:if>
                    <xsl:if test="@name='Definer hovedproblem (dette utløser spesifikke tester for gitt område)'">
                        <body_main_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </body_main_1>
                    </xsl:if>
                    <xsl:if test="@name='Bokstav'">
                        <icpc_letter_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </icpc_letter_1>
                    </xsl:if>
                    <xsl:if test="@name='Nummerkode'">
                        <icpc_nr_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </icpc_nr_1>
                    </xsl:if>
                    <xsl:if test="@name='Fritekst (må fylles ut)'">
                        <diagnose_1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </diagnose_1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_act_w1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_act_w1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_w1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_w1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_act_w1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_act_w1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_w1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_w1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_act_w1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_act_w1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_w1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_w1>
                    </xsl:if>
                    <xsl:if test="@name='Arbeidsevne - Fysioprim'">
                        <work_ability_w1>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </work_ability_w1>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_act_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_act_w2>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_w2>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_act_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_act_w2>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_w2>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_act_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_act_w2>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_w2>
                    </xsl:if>
                    <xsl:if test="@name='Arbeidsevne - Fysioprim'">
                        <work_ability_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </work_ability_w2>
                    </xsl:if>
                    <xsl:if test="@name='Hvor mye smerter har du hatt den SISTE UKEN?'">
                        <oreb_q2_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q2_w2>
                    </xsl:if>
                    <xsl:if test="@name='Pain Self-Efficacy Questionnaire (PSEQ-2)'">
                        <pseq_score_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_score_w2>
                    </xsl:if>
                    <xsl:if test="@name='1. Jeg kan gjøre noen former for arbeid til tross for smerten (arbeid inkluderer husarbeid og lønnet/ulønnet arbeid)'">
                        <pseq_q1_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_q1_w2>
                    </xsl:if>
                    <xsl:if test="@name='2. Jeg kan leve en normal livsstil til tross for smerten'">
                        <pseq_q2_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_q2_w2>
                    </xsl:if>
                    <xsl:if test="@name='Siden behandling startet er jeg :'">
                        <gpe_w2>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </gpe_w2>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_act_w3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_act_w3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_w3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_w3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_act_w3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_act_w3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_w3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_w3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_act_w3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_act_w3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_w3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_w3>
                    </xsl:if>
                    <xsl:if test="@name='Arbeidsevne - Fysioprim'">
                        <work_ability_w3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </work_ability_w3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_act_w4>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_act_w4>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_w4>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_w4>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_act_w4>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_act_w4>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_w4>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_w4>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_act_w4>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_act_w4>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_w4>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_w4>
                    </xsl:if>
                    <xsl:if test="@name='Arbeidsevne - Fysioprim'">
                        <work_ability_w4>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </work_ability_w4>
                    </xsl:if>
                    <xsl:if test="@name='Siden behandling startet er jeg :'">
                        <gpe_w4>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </gpe_w4>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_act_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_act_w8>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_w8>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_act_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_act_w8>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_w8>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_act_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_act_w8>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_w8>
                    </xsl:if>
                    <xsl:if test="@name='Arbeidsevne - Fysioprim'">
                        <work_ability_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </work_ability_w8>
                    </xsl:if>
                    <xsl:if test="@name='Hvor mye smerter har du hatt den SISTE UKEN?'">
                        <oreb_q2_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q2_w8>
                    </xsl:if>
                    <xsl:if test="@name='Pain Self-Efficacy Questionnaire (PSEQ-2)'">
                        <pseq_score_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_score_w8>
                    </xsl:if>
                    <xsl:if test="@name='1. Jeg kan gjøre noen former for arbeid til tross for smerten (arbeid inkluderer husarbeid og lønnet/ulønnet arbeid)'">
                        <pseq_q1_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_q1_w8>
                    </xsl:if>
                    <xsl:if test="@name='2. Jeg kan leve en normal livsstil til tross for smerten'">
                        <pseq_q2_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_q2_w8>
                    </xsl:if>
                    <xsl:if test="@name='Siden behandling startet er jeg :'">
                        <gpe_w8>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </gpe_w8>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_act_p_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_act_p_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_p_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_p_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_act_p_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_act_p_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_p_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_p_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_act_p_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_act_p_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_p_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_p_3>
                    </xsl:if>
                    <xsl:if test="@name='Gange'">
                        <eq5d_walk_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eq5d_walk_3>
                    </xsl:if>
                    <xsl:if test="@name='Personlig stell'">
                        <eq5d_care_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eq5d_care_3>
                    </xsl:if>
                    <xsl:if test="@name='Vanlige gjøremål '">
                        <eq5d_adl_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eq5d_adl_3>
                    </xsl:if>
                    <xsl:if test="@name='Smerter/ ubehag'">
                        <eq5d_pain_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eq5d_pain_3>
                    </xsl:if>
                    <xsl:if test="@name='Angst/ depresjon'">
                        <eq5d_depr_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eq5d_depr_3>
                    </xsl:if>
                    <xsl:if test="@name='Søvn'">
                        <qol15D_q5_sleep_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </qol15D_q5_sleep_3>
                    </xsl:if>
                    <xsl:if test="@name='Livskraft'">
                        <qol15D_q14_vital_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </qol15D_q14_vital_3>
                    </xsl:if>
                    <xsl:if test="@name='Hvor mye smerter har du hatt den SISTE UKEN?'">
                        <oreb_q2_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </oreb_q2_3>
                    </xsl:if>
                    <xsl:if test="@name='Hode'">
                        <painsite_head_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_head_3>
                    </xsl:if>
                    <xsl:if test="@name='Nakke'">
                        <painsite_neck_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_neck_3>
                    </xsl:if>
                    <xsl:if test="@name='Skuldre'">
                        <painsite_shou_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_shou_3>
                    </xsl:if>
                    <xsl:if test="@name='Øvre del rygg'">
                        <painsite_uback_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_uback_3>
                    </xsl:if>
                    <xsl:if test="@name='Albuer'">
                        <painsite_elbow_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_elbow_3>
                    </xsl:if>
                    <xsl:if test="@name='Håndledd / hender'">
                        <painsite_hand_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_hand_3>
                    </xsl:if>
                    <xsl:if test="@name='Hofter / lår'">
                        <painsite_thigh_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_thigh_3>
                    </xsl:if>
                    <xsl:if test="@name='Korsrygg'">
                        <painsite_lback_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_lback_3>
                    </xsl:if>
                    <xsl:if test="@name='Ankler / føtter'">
                        <painsite_feet_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_feet_3>
                    </xsl:if>
                    <xsl:if test="@name='Knær'">
                        <painsite_knee_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_knee_3>
                    </xsl:if>
                    <xsl:if test="@name='Antall affiserte regioner:'">
                        <painsite_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </painsite_3>
                    </xsl:if>
                    <xsl:if test="@name='Er smerten kontinuerlig'">
                        <pain_continuous_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pain_continuous_3>
                    </xsl:if>
                    <xsl:if test="@name='Er smerten av varierende intensitet?'">
                        <pain_vary_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pain_vary_3>
                    </xsl:if>
                    <xsl:if test="@name='Hvordan vil du beskrive smertevariasjonen best?'">
                        <pain_variation_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pain_variation_3>
                    </xsl:if>
                    <xsl:if test="@name='Hvor ofte har du vanligvis disse smertene?'">
                        <pain_freq_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pain_freq_3>
                    </xsl:if>
                    <xsl:if test="@name='Antall medisiner du bruker daglig:'">
                        <medic_number_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </medic_number_3>
                    </xsl:if>
                    <xsl:if test="@name='Arbeidsevne - Fysioprim'">
                        <work_ability_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </work_ability_3>
                    </xsl:if>
                    <xsl:if test="@name='Mosjon og Trening Fysioprim'">
                        <pa_sum_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pa_sum_3>
                    </xsl:if>
                    <xsl:if test="@name='Hvor ofte driver du mosjon eller trening?'">
                        <pa_freq_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pa_freq_3>
                    </xsl:if>
                    <xsl:if test="@name='Hvor hardt mosjonerer / trener du?'">
                        <pa_int_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pa_int_3>
                    </xsl:if>
                    <xsl:if test="@name='Hvor lenge holder du på hver gang?'">
                        <pa_dur_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pa_dur_3>
                    </xsl:if>
                    <xsl:if test="@name='Gjennomsnitt:'">
                        <hscl10_score_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_score_3>
                    </xsl:if>
                    <xsl:if test="@name='1. Plutselig skremt uten grunn'">
                        <hscl10_q1_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_q1_3>
                    </xsl:if>
                    <xsl:if test="@name='2. Føler du deg svimmel eller kraftesløs'">
                        <hscl10_q2_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_q2_3>
                    </xsl:if>
                    <xsl:if test="@name='3. Føler deg anspent eller opphisset'">
                        <hscl10_q3_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_q3_3>
                    </xsl:if>
                    <xsl:if test="@name='4. Anfall av redsel eller panikk'">
                        <hscl10_q4_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_q4_3>
                    </xsl:if>
                    <xsl:if test="@name='5. Anklager deg selv for ting'">
                        <hscl10_q5_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_q5_3>
                    </xsl:if>
                    <xsl:if test="@name='6. Vanskelig for å sove'">
                        <hscl10_q6_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_q6_3>
                    </xsl:if>
                    <xsl:if test="@name='7. Følelse av håpløshet mhp. framtiden'">
                        <hscl10_q7_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_q7_3>
                    </xsl:if>
                    <xsl:if test="@name='8. Føler deg nedfor'">
                        <hscl10_q8_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_q8_3>
                    </xsl:if>
                    <xsl:if test="@name='9. Føler at alt krever stor anstrengelse'">
                        <hscl10_q9_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_q9_3>
                    </xsl:if>
                    <xsl:if test="@name='10. Føler at du ikke er noe verd'">
                        <hscl10_q10_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </hscl10_q10_3>
                    </xsl:if>
                    <xsl:if test="@name='Siden behandling startet er jeg :'">
                        <gpe_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </gpe_3>
                    </xsl:if>
                    <xsl:if test="@name='I hvilken grad har du hatt nytte av fysioterapibehandling?'">
                        <treat_benefit_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </treat_benefit_3>
                    </xsl:if>
                    <xsl:if test="@name='I hvilken grad ble dine forventninger til fysioterapi innfridd?'">
                        <treat_expect_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </treat_expect_3>
                    </xsl:if>
                    <xsl:if test="@name='Jeg ble hørt og forstått av min fysioterapeut?'">
                        <patient_physio_q1_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </patient_physio_q1_3>
                    </xsl:if>
                    <xsl:if test="@name='Jeg har høy tiltro til min fysioterapeuts faglige kvalifikasjoner'">
                        <patient_physio_q2_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </patient_physio_q2_3>
                    </xsl:if>
                    <xsl:if test="@name='Samlet sett er jeg svært godt fornøyd med oppfølgingen jeg fikk av min terapeut'">
                        <patient_physio_q3_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </patient_physio_q3_3>
                    </xsl:if>
                    <xsl:if test="@name='Har du gjennomført øvelsene som anbefalt av fysioterapeuten?'">
                        <compliance_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </compliance_3>
                    </xsl:if>
                    <xsl:if test="@name='SPØRRESKJEMA OM MUSKEL- OG SKJELETTHELSE (MSK-HQ)'">
                        <mskhq_score_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_score_3>
                    </xsl:if>
                    <xsl:if test="@name='1. Smerte/stivhet i løpet av dagen'">
                        <mskhq_q1_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q1_3>
                    </xsl:if>
                    <xsl:if test="@name='2. Smerter/stivhet om natten.'">
                        <mskhq_q2_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q2_3>
                    </xsl:if>
                    <xsl:if test="@name='3. Gange'">
                        <mskhq_q3_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q3_3>
                    </xsl:if>
                    <xsl:if test="@name='4. Vaske seg/påkledning'">
                        <mskhq_q4_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q4_3>
                    </xsl:if>
                    <xsl:if test="@name='5. Fysisk aktivitetsnivå'">
                        <mskhq_q5_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q5_3>
                    </xsl:if>
                    <xsl:if test="@name='6. Arbeid/daglige aktiviteter'">
                        <mskhq_q6_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q6_3>
                    </xsl:if>
                    <xsl:if test="@name='7. Sosiale aktiviteter og hobbyer'">
                        <mskhq_q7_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q7_3>
                    </xsl:if>
                    <xsl:if test="@name='8. Behov for hjelp'">
                        <mskhq_q8_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q8_3>
                    </xsl:if>
                    <xsl:if test="@name='9. Søvn'">
                        <mskhq_q9_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q9_3>
                    </xsl:if>
                    <xsl:if test="@name='10. Utmattelse eller lite energi '">
                        <mskhq_q10_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q10_3>
                    </xsl:if>
                    <xsl:if test="@name='11. Følelsesmessig velvære'">
                        <mskhq_q11_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q11_3>
                    </xsl:if>
                    <xsl:if test="@name='12. Forståelse av dine helseplager og pågående behandling'">
                        <mskhq_q12_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q12_3>
                    </xsl:if>
                    <xsl:if test="@name='13. Tro på å mestre symptomene dine'">
                        <mskhq_q13_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q13_3>
                    </xsl:if>
                    <xsl:if test="@name='14. Generell påvirkning'">
                        <mskhq_q14_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_q14_3>
                    </xsl:if>
                    <xsl:if test="@name='Fysisk aktivitetsnivå'">
                        <mskhq_pa_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </mskhq_pa_3>
                    </xsl:if>
                    <xsl:if test="@name='Pain Self-Efficacy Questionnaire (PSEQ-2)'">
                        <pseq_score_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_score_3>
                    </xsl:if>
                    <xsl:if test="@name='1. Jeg kan gjøre noen former for arbeid til tross for smerten (arbeid inkluderer husarbeid og lønnet/ulønnet arbeid)'">
                        <pseq_q1_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_q1_3>
                    </xsl:if>
                    <xsl:if test="@name='2. Jeg kan leve en normal livsstil til tross for smerten'">
                        <pseq_q2_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </pseq_q2_3>
                    </xsl:if>
                    <xsl:if test="@name='Mål '">
                        <eval_goal_p_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eval_goal_p_3>
                    </xsl:if>
                    <xsl:if test="@name='Hva tror du har vært den viktigste faktoren for bedring/ manglende bedring for dine plager (En til to setninger)'">
                        <treatmentfactor_patient_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </treatmentfactor_patient_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_act_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_act_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 1/small'">
                        <psfs1_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs1_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_act_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_act_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 2/small'">
                        <psfs2_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs2_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_act_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_act_3>
                    </xsl:if>
                    <xsl:if test="@name='smallAktivitet 3/small'">
                        <psfs3_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </psfs3_3>
                    </xsl:if>
                    <xsl:if test="@name='Mål'">
                        <eval_goal_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </eval_goal_3>
                    </xsl:if>
                    <xsl:if test="@name='Fortsetter behandlingen?'">
                        <treat_contin_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </treat_contin_3>
                    </xsl:if>
                    <xsl:if test="@name='Antall konsultasjoner totalt'">
                        <consultation_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </consultation_3>
                    </xsl:if>
                    <xsl:if test="@name='Viktig bakgrunnsinformasjon for behandlingsutfall'">
                        <treat_describe_important_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </treat_describe_important_3>
                    </xsl:if>
                    <xsl:if test="@name='Pasienten har fått følgende behandling:'">
                        <treat_describe_treat_3>
                            <xsl:choose>
                                <xsl:when test="answer/@selected='true'">
                                    <xsl:value-of select="answer[@selected='true']"/>
                                </xsl:when>
                                <xsl:when test="answer[not(@selected)]">
                                    <xsl:value-of select="answer"/>
                                </xsl:when>
                                <xsl:otherwise>_unknown_</xsl:otherwise>
                            </xsl:choose>
                        </treat_describe_treat_3>
                    </xsl:if>
                </xsl:for-each>

                <!-- Code for condition : 2  ......................... END -->


                <!-- Code for condition : 3  START ....................... -->

                <xsl:for-each select="question">
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Revmatisk sykdom'">
                                <como_ra_1><xsl:value-of select="./@selected"/></como_ra_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Hjertesykdom'">
                                <como_heart_1><xsl:value-of select="./@selected"/></como_heart_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Astma/ lungesykdom'">
                                <como_asthma_1><xsl:value-of select="./@selected"/></como_asthma_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Nevrologisk sykdom (f.eks tidligere hjerneslag eller MS)'">
                                <como_neuro_1><xsl:value-of select="./@selected"/></como_neuro_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Kreft/ tidligere kreft'">
                                <como_cancer_1><xsl:value-of select="./@selected"/></como_cancer_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Psykiske plager'">
                                <como_psych_1><xsl:value-of select="./@selected"/></como_psych_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Demens/ kognitiv svikt'">
                                <como_dementhia_1><xsl:value-of select="./@selected"/></como_dementhia_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Osteoporose'">
                                <como_osteoporosis_1><xsl:value-of select="./@selected"/></como_osteoporosis_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Diabetes'">
                                <como_diabetes_1><xsl:value-of select="./@selected"/></como_diabetes_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Magesmerter'">
                                <como_stomach_pain_1><xsl:value-of select="./@selected"/></como_stomach_pain_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Hodepine/svimmelhet'">
                                <como_headache_1><xsl:value-of select="./@selected"/></como_headache_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Utmattelse'">
                                <como_fatigue_1><xsl:value-of select="./@selected"/></como_fatigue_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Annet'">
                                <como_other_1><xsl:value-of select="./@selected"/></como_other_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Andre nåværende sykdommer eller plager:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Beskriv annet:'">
                                <como_other_spec_1><xsl:value-of select="./@selected"/></como_other_spec_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='I lønnet arbeid'">
                                <employ_paid_1><xsl:value-of select="./@selected"/></employ_paid_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Skoleelev / Student'">
                                <employ_stud_1><xsl:value-of select="./@selected"/></employ_stud_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Pensjonist'">
                                <employ_retired_1><xsl:value-of select="./@selected"/></employ_retired_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Uføretrygdet'">
                                <employ_disability_1><xsl:value-of select="./@selected"/></employ_disability_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Sykmeldt'">
                                <employ_sick_1><xsl:value-of select="./@selected"/></employ_sick_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Arbeidsavklaring'">
                                <employ_assess_1><xsl:value-of select="./@selected"/></employ_assess_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Ulønnet arbeid (eks. hjemme/frivillighetsarbeid)'">
                                <employ_unpaid_1><xsl:value-of select="./@selected"/></employ_unpaid_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Arbeidsledig'">
                                <employ_unempl_1><xsl:value-of select="./@selected"/></employ_unempl_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Foreldrepermisjon'">
                                <employ_parentleave_1><xsl:value-of select="./@selected"/></employ_parentleave_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Angi stillingsprosent'">
                                <employ_paidp_1><xsl:value-of select="./@selected"/></employ_paidp_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Angi uføregrad i prosent'">
                                <employ_disabilityp_1><xsl:value-of select="./@selected"/></employ_disabilityp_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hva er din arbeidssituasjon nå? '">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Angi sykmeldingsgrad i prosent'">
                                <employ_sickp_1><xsl:value-of select="./@selected"/></employ_sickp_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hvilke medisiner?'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Paracetamol Paracet Panodil Pimol Pinex eller Perfalgan'">
                                <medic_type_paracet_1><xsl:value-of select="./@selected"/></medic_type_paracet_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hvilke medisiner?'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Albyl-E (500 mg) Aspirin Globoid eller Dispril'">
                                <medic_type_albyle_1><xsl:value-of select="./@selected"/></medic_type_albyle_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hvilke medisiner?'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Ibuprofen Ibux Ibuprox Ibumetin Brufen Naproxen Naprosyn eller Ladox'">
                                <medic_type_ibux_1><xsl:value-of select="./@selected"/></medic_type_ibux_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Hvilke medisiner?'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Andre'">
                                <medic_type_other_1><xsl:value-of select="./@selected"/></medic_type_other_1>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Har du brukt noen medisiner mot smerte i løpet av den siste uken?'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Paracetamol Paracet Panodil Pimol Pinex eller Perfalgan'">
                                <medic_paracet_3><xsl:value-of select="./@selected"/></medic_paracet_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Har du brukt noen medisiner mot smerte i løpet av den siste uken?'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Albyl-E (500 mg) Aspirin Globoid eller Dispril'">
                                <medic_albyle_3><xsl:value-of select="./@selected"/></medic_albyle_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Har du brukt noen medisiner mot smerte i løpet av den siste uken?'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Ibuprofen Ibux Ibuprox Ibumetin Brufen Naproxen Naprosyn eller Ladox'">
                                <medic_ibux_3><xsl:value-of select="./@selected"/></medic_ibux_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Har du brukt noen medisiner mot smerte i løpet av den siste uken?'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Andre'">
                                <medic_other_3><xsl:value-of select="./@selected"/></medic_other_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Har du brukt noen medisiner mot smerte i løpet av den siste uken?'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Hvilke andre medisiner?'">
                                <medic_other_spec_3><xsl:value-of select="./@selected"/></medic_other_spec_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Angi stillingsprosent'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='I lønnet arbeid'">
                                <employ_paid_3><xsl:value-of select="./@selected"/></employ_paid_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Angi stillingsprosent'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Skoleelev / Student'">
                                <employ_stud_3><xsl:value-of select="./@selected"/></employ_stud_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Angi stillingsprosent'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Pensjonist'">
                                <employ_retired_3><xsl:value-of select="./@selected"/></employ_retired_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Angi stillingsprosent'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Uføretrygdet'">
                                <employ_disability_3><xsl:value-of select="./@selected"/></employ_disability_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Angi stillingsprosent'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Sykmeldt'">
                                <employ_sick_3><xsl:value-of select="./@selected"/></employ_sick_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Angi stillingsprosent'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Arbeidsavklaring'">
                                <employ_assess_3><xsl:value-of select="./@selected"/></employ_assess_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Angi stillingsprosent'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Ulønnet arbeid (eks. hjemme/frivillighetsarbeid)'">
                                <employ_unpaid_3><xsl:value-of select="./@selected"/></employ_unpaid_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Angi stillingsprosent'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Arbeidsledig'">
                                <employ_unempl_3><xsl:value-of select="./@selected"/></employ_unempl_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Angi stillingsprosent'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Foreldrepermisjon'">
                                <employ_parentleave_3><xsl:value-of select="./@selected"/></employ_parentleave_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Oppfølging arbeidssituasjon'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Angi stillingsprosent'">
                                <employ_situation_paidp_3><xsl:value-of select="./@selected"/></employ_situation_paidp_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Oppfølging arbeidssituasjon'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Angi uføregrad i prosent'">
                                <employ_situation_disabilityp_3><xsl:value-of select="./@selected"/></employ_situation_disabilityp_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Oppfølging arbeidssituasjon'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Angi sykmeldingsgrad i prosent'">
                                <employ_situation_sickp_3><xsl:value-of select="./@selected"/></employ_situation_sickp_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Årsak til avslutning:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Behov opphørt'">
                                <end_cause_patient_3><xsl:value-of select="./@selected"/></end_cause_patient_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Årsak til avslutning:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Effektstagnasjon'">
                                <end_cause_effect_3><xsl:value-of select="./@selected"/></end_cause_effect_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Årsak til avslutning:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Ingen effekt'">
                                <end_cause_noeffect_3><xsl:value-of select="./@selected"/></end_cause_noeffect_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Årsak til avslutning:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Pasienten ønsker ikke videre behandling'">
                                <end_cause_followup_3><xsl:value-of select="./@selected"/></end_cause_followup_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Årsak til avslutning:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Flyttet ut av kommune'">
                                <end_cause_move_3><xsl:value-of select="./@selected"/></end_cause_move_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Årsak til avslutning:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Forverret medsinsk tilstand'">
                                <end_cause_medic_3><xsl:value-of select="./@selected"/></end_cause_medic_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Årsak til avslutning:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Død'">
                                <end_cause_death_3><xsl:value-of select="./@selected"/></end_cause_death_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="@name = 'Årsak til avslutning:'">
                        <xsl:for-each select="answer">
                            <xsl:if test=".='Annet'">
                                <end_cause_other_3><xsl:value-of select="./@selected"/></end_cause_other_3>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>

                <!-- Code for condition : 3  ......................... END -->


                <!-- Code for condition : 4  START ....................... -->

                <xsl:if test="@name='1. Redusert aktivitet, hvile, avlastning'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_advice_rest_3><xsl:value-of select="answer"/></treat_advice_rest_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_advice_rest_3><xsl:value-of select="answer"/></treat_advice_rest_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='2. Økt fysisk aktivitet'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_advice_pa_3><xsl:value-of select="answer"/></treat_advice_pa_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_advice_pa_3><xsl:value-of select="answer"/></treat_advice_pa_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='3. Å Motvirke frykt for bevegelse og aktivitet'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_advice_fear_3><xsl:value-of select="answer"/></treat_advice_fear_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_advice_fear_3><xsl:value-of select="answer"/></treat_advice_fear_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='4. Egenmestring av plagene i hverdagen'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_advice_selfman_3><xsl:value-of select="answer"/></treat_advice_selfman_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_advice_selfman_3><xsl:value-of select="answer"/></treat_advice_selfman_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='5. Arbeid og tilpasning av arbeid, inkludert oppgaver i hjemmet'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_advice_work_3><xsl:value-of select="answer"/></treat_advice_work_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_advice_work_3><xsl:value-of select="answer"/></treat_advice_work_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='6. Søvn'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_advice_sleep_3><xsl:value-of select="answer"/></treat_advice_sleep_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_advice_sleep_3><xsl:value-of select="answer"/></treat_advice_sleep_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='7. Vektendring (økt eller redusert)'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_advice_weight_3><xsl:value-of select="answer"/></treat_advice_weight_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_advice_weight_3><xsl:value-of select="answer"/></treat_advice_weight_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='8. Sosial deltakelse'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_advice_social_3><xsl:value-of select="answer"/></treat_advice_social_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_advice_social_3><xsl:value-of select="answer"/></treat_advice_social_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='9. Mestring av stress, angst, depresjon e.l'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_advice_distress_3><xsl:value-of select="answer"/></treat_advice_distress_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_advice_distress_3><xsl:value-of select="answer"/></treat_advice_distress_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='10. Forventninger, prognose og forløp'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_advice_expect_3><xsl:value-of select="answer"/></treat_advice_expect_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_advice_expect_3><xsl:value-of select="answer"/></treat_advice_expect_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='1. Spesifikke styrkeøvelser'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_active_strength_3><xsl:value-of select="answer"/></treat_active_strength_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_active_strength_3><xsl:value-of select="answer"/></treat_active_strength_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='2. Utholdenhetstrening'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_active_cardio_3><xsl:value-of select="answer"/></treat_active_cardio_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_active_cardio_3><xsl:value-of select="answer"/></treat_active_cardio_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='3. Spesifikke balanse- eller koordinasjonsøvelser'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_active_balance_3><xsl:value-of select="answer"/></treat_active_balance_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_active_balance_3><xsl:value-of select="answer"/></treat_active_balance_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='4. Spesifikke muskeltøyninger eller leddmobilisering'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_active_stretch_3><xsl:value-of select="answer"/></treat_active_stretch_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_active_stretch_3><xsl:value-of select="answer"/></treat_active_stretch_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='5. Spesifikk trening for postural kontroll, holdning eller avspenning'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_active_posture_3><xsl:value-of select="answer"/></treat_active_posture_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_active_posture_3><xsl:value-of select="answer"/></treat_active_posture_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='6. Generelle øvelser og tøyninger'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_active_general_3><xsl:value-of select="answer"/></treat_active_general_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_active_general_3><xsl:value-of select="answer"/></treat_active_general_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='1. Spesifikke oppgaver eller øvelser hjemme (skriftlig)'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_home_3><xsl:value-of select="answer"/></treat_home_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_home_3><xsl:value-of select="answer"/></treat_home_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='1. Massasje og bløtdelsbehandling, inkludert tverrmassasje'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_passive_massage_3><xsl:value-of select="answer"/></treat_passive_massage_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_passive_massage_3><xsl:value-of select="answer"/></treat_passive_massage_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='2. Leddmobilisering og -manipulasjon'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_passive_joint_3><xsl:value-of select="answer"/></treat_passive_joint_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_passive_joint_3><xsl:value-of select="answer"/></treat_passive_joint_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='3. Tøyninger'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_passive_stretch_3><xsl:value-of select="answer"/></treat_passive_stretch_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_passive_stretch_3><xsl:value-of select="answer"/></treat_passive_stretch_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='4. Triggerpunkt-, nålebehandling eller akupunktur'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_passive_trigger_3><xsl:value-of select="answer"/></treat_passive_trigger_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_passive_trigger_3><xsl:value-of select="answer"/></treat_passive_trigger_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='5. Trykkbølgebehandling'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_passive_shockwave_3><xsl:value-of select="answer"/></treat_passive_shockwave_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_passive_shockwave_3><xsl:value-of select="answer"/></treat_passive_shockwave_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Individuell behandling'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_setting_individual_3><xsl:value-of select="answer"/></treat_setting_individual_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_setting_individual_3><xsl:value-of select="answer"/></treat_setting_individual_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Behandling i gruppe'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_setting_group_3><xsl:value-of select="answer"/></treat_setting_group_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_setting_group_3><xsl:value-of select="answer"/></treat_setting_group_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Egentrening'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_setting_self_3><xsl:value-of select="answer"/></treat_setting_self_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_setting_self_3><xsl:value-of select="answer"/></treat_setting_self_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Behandlingen har foregått hos'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_physio_3><xsl:value-of select="answer"/></treat_physio_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_physio_3><xsl:value-of select="answer"/></treat_physio_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Fastlege'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_discuss_gp_3><xsl:value-of select="answer"/></treat_discuss_gp_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_discuss_gp_3><xsl:value-of select="answer"/></treat_discuss_gp_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Spesialist'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_discuss_specialist_3><xsl:value-of select="answer"/></treat_discuss_specialist_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_discuss_specialist_3><xsl:value-of select="answer"/></treat_discuss_specialist_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Psykolog'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_discuss_psycho_3><xsl:value-of select="answer"/></treat_discuss_psycho_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_discuss_psycho_3><xsl:value-of select="answer"/></treat_discuss_psycho_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Annen fysioterapeut'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_discuss_physio_3><xsl:value-of select="answer"/></treat_discuss_physio_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_discuss_physio_3><xsl:value-of select="answer"/></treat_discuss_physio_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Annen helseprofesjon'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_discuss_other_3><xsl:value-of select="answer"/></treat_discuss_other_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_discuss_other_3><xsl:value-of select="answer"/></treat_discuss_other_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='NAV'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_contact_nav_3><xsl:value-of select="answer"/></treat_contact_nav_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_contact_nav_3><xsl:value-of select="answer"/></treat_contact_nav_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Bedriftshelsetjenesten'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_contact_occup_3><xsl:value-of select="answer"/></treat_contact_occup_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_contact_occup_3><xsl:value-of select="answer"/></treat_contact_occup_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Arbeidsgiver'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_contact_employ_3><xsl:value-of select="answer"/></treat_contact_employ_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_contact_employ_3><xsl:value-of select="answer"/></treat_contact_employ_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Familie'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_contact_family_3><xsl:value-of select="answer"/></treat_contact_family_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_contact_family_3><xsl:value-of select="answer"/></treat_contact_family_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Beskriv tiltak som pasienten har fått så godt at en fysioterapikollega kan gjenta behandlingen mest mulig likt deg på sin pasient.'">
                    <xsl:for-each select="question">
                        <xsl:choose>
                            <xsl:when test="answer/@selected='true'">
                                <treat_describe_3><xsl:value-of select="answer"/></treat_describe_3>
                            </xsl:when>
                            <xsl:when test="answer[not(@selected)]">
                                <treat_describe_3><xsl:value-of select="answer"/></treat_describe_3>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>

                <!-- Code for condition : 4  ......................... END -->


                <!-- Code for condition : 6  START ....................... -->

                <xsl:if test="@name='Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte og/eller smertefulle aktive bevegelsesutslag i vektbærende stilling'">
                            <neck_move_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </neck_move_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Spurling test positiv'">
                            <neck_spurling_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </neck_spurling_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Ev. kommentar nevrologiske funn'">
                            <neck_comment_neuro_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </neck_comment_neuro_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Konklusjon av nakkevurdering '">
                            <neck_conclusion_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </neck_conclusion_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Ev. kommentarer:'">
                            <neck_comment_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </neck_comment_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte og/eller smertefulle aktive bevegelsesutslag'">
                            <shoulder_move_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </shoulder_move_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Redusert passiv utadrotasjon '">
                            <shoulder_passive_extrot_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </shoulder_passive_extrot_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smertebue '">
                            <shoulder_painfularc_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </shoulder_painfularc_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved Hawkins test'">
                            <shoulder_hawkins_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </shoulder_hawkins_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved isometrisk abduksjon'">
                            <shoulder_iso_abdpain_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </shoulder_iso_abdpain_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved isometrisk utadrotasjon'">
                            <shoulder_iso_extrotpain_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </shoulder_iso_extrotpain_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Nedsatt kraft ved isometrisk abduksjon'">
                            <shoulder_iso_abdpow_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </shoulder_iso_abdpow_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Nedsatt kraft ved isometrisk utadrotasjon'">
                            <shoulder_iso_extrotpow_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </shoulder_iso_extrotpow_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Eventuelt kommentarer:'">
                            <shoulder_comment_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </shoulder_comment_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte og/eller smertefulle  aktive bevegelsesutslag i stående stilling'">
                            <back_move_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </back_move_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Positiv Straight leg raise (Lasegues prøve) '">
                            <back_slr_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </back_slr_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Kommentar nevrologiske funn'">
                            <back_comment_neuro_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </back_comment_neuro_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Ev. andre kommentarer:'">
                            <back_comment_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </back_comment_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte og/eller smertefulle aktive bevegelsesutslag '">
                            <hip_move_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </hip_move_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte og/eller smertefulle passive bevegelsesutslag '">
                            <hip_move_passive_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </hip_move_passive_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Positiv FABER/Patricks test'">
                            <hip_faber_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </hip_faber_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Positiv FADDIR test (passiv fleksjon adduksjon og innadrotasjon)'">
                            <hip_faddir_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </hip_faddir_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Positiv Trendelenburg'">
                            <hip_trend_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </hip_trend_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte og/eller smertefulle aktive bevegelsesutslag'">
                            <knee_move_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_move_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte og/eller smertefulle passive bevegelsesutslag'">
                            <knee_move_passive_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_move_passive_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Er det hydrops i kneet'">
                            <knee_hydrops_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_hydrops_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Har pasienten vært utsatt for et traume'">
                            <knee_traumatic_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_traumatic_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Positiv Pivot Shift test'">
                            <knee_pivot_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_pivot_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Positiv Lachman test uten endepunkt'">
                            <knee_lachman_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_lachman_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Positiv Sag test'">
                            <knee_sag_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_sag_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Gjenkjennbar smerte ved McMurrays test'">
                            <knee_mcmurray_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_mcmurray_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Gjenkjennbar smerte ved palpasjon i leddspalten'">
                            <knee_palp_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_palp_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Forøket valgus ved stress test på ekstendert kne'">
                            <knee_valgus_ext_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_valgus_ext_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Forøket valgus ved stress test på 20 graders flektert kne'">
                            <knee_valgus_flex_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_valgus_flex_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Forøket varus ved stress test på ekstendert kne'">
                            <knee_varus_ext_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_varus_ext_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Forøket varus ved stress test på 20 graders flektert kne'">
                            <knee_varus_flex_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_varus_flex_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name='Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Eventuelt kommentarer:'">
                            <knee_comment_1>
                                <xsl:choose>
                                    <xsl:when test="answer/@selected = 'true'">
                                        <xsl:value-of select="answer[@selected = 'true']"/>
                                    </xsl:when>
                                    <xsl:when test="answer[not(@selected)]">
                                        <xsl:value-of select="answer"/>
                                    </xsl:when>
                                    <xsl:otherwise>_unknown_</xsl:otherwise>
                                </xsl:choose>
                            </knee_comment_1>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <!-- Code for condition : 6  ......................... END -->


                <!-- Code for condition : 7  START ....................... -->

                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <neck_move_rom_flex_1><xsl:value-of select="./@selected"/></neck_move_rom_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <neck_move_rom_ext_1><xsl:value-of select="./@selected"/></neck_move_rom_ext_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Rotasjon'">
                                    <neck_move_rom_rot_1><xsl:value-of select="./@selected"/></neck_move_rom_rot_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Lateralfleksjon'">
                                    <neck_move_rom_lat_1><xsl:value-of select="./@selected"/></neck_move_rom_lat_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke reduserte bevegelsesutslag'">
                                    <neck_move_rom_not_1><xsl:value-of select="./@selected"/></neck_move_rom_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <neck_move_pain_flex_1><xsl:value-of select="./@selected"/></neck_move_pain_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <neck_move_pain_ext_1><xsl:value-of select="./@selected"/></neck_move_pain_ext_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Rotasjon'">
                                    <neck_move_pain_rot_1><xsl:value-of select="./@selected"/></neck_move_pain_rot_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Lateralfleksjon'">
                                    <neck_move_pain_lat_1><xsl:value-of select="./@selected"/></neck_move_pain_lat_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ingen smerter ved aktive bevgelsesutslag'">
                                    <neck_move_pain_not_1><xsl:value-of select="./@selected"/></neck_move_pain_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Angi nevrologiske funn'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke aktuelt'">
                                    <neck_neuro_not_1><xsl:value-of select="./@selected"/></neck_neuro_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Angi nevrologiske funn'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Redusert kraft'">
                                    <neck_neuro_pow_1><xsl:value-of select="./@selected"/></neck_neuro_pow_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Angi nevrologiske funn'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Redusert sensibilitet'">
                                    <neck_neuro_sens_1><xsl:value-of select="./@selected"/></neck_neuro_sens_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Nakkeundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Angi nevrologiske funn'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Unormale reflekser'">
                                    <neck_neuro_reflex_1><xsl:value-of select="./@selected"/></neck_neuro_reflex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <shoulder_move_rom_flex_1><xsl:value-of select="./@selected"/></shoulder_move_rom_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Abduksjon'">
                                    <shoulder_move_rom_abd_1><xsl:value-of select="./@selected"/></shoulder_move_rom_abd_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Adduksjon'">
                                    <shoulder_move_rom_add_1><xsl:value-of select="./@selected"/></shoulder_move_rom_add_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Utadrotasjon'">
                                    <shoulder_move_rom_extrot_1><xsl:value-of select="./@selected"/></shoulder_move_rom_extrot_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Innadrotasjon'">
                                    <shoulder_move_rom_introt_1><xsl:value-of select="./@selected"/></shoulder_move_rom_introt_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke reduserte bevegelsesutslag'">
                                    <shoulder_move_rom_not_1><xsl:value-of select="./@selected"/></shoulder_move_rom_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <shoulder_move_pain_flex_1><xsl:value-of select="./@selected"/></shoulder_move_pain_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Abduksjon'">
                                    <shoulder_move_pain_abd_1><xsl:value-of select="./@selected"/></shoulder_move_pain_abd_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Adduksjon'">
                                    <shoulder_move_pain_add_1><xsl:value-of select="./@selected"/></shoulder_move_pain_add_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Utadrotasjon'">
                                    <shoulder_move_pain_extrot_1><xsl:value-of select="./@selected"/></shoulder_move_pain_extrot_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Innadrotasjon'">
                                    <shoulder_move_pain_introt_1><xsl:value-of select="./@selected"/></shoulder_move_pain_introt_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Skulderundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke reduserte bevegelsesutslag'">
                                    <shoulder_move_pain_not_1><xsl:value-of select="./@selected"/></shoulder_move_pain_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <back_move_rom_flex_1><xsl:value-of select="./@selected"/></back_move_rom_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <back_move_rom_ext_1><xsl:value-of select="./@selected"/></back_move_rom_ext_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Rotasjon'">
                                    <back_move_rom_rot_1><xsl:value-of select="./@selected"/></back_move_rom_rot_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Lateralfleksjon'">
                                    <back_move_rom_lat_1><xsl:value-of select="./@selected"/></back_move_rom_lat_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke reduserte bevegelsesutslag'">
                                    <back_move_rom_not_1><xsl:value-of select="./@selected"/></back_move_rom_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <back_move_pain_flex_1><xsl:value-of select="./@selected"/></back_move_pain_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <back_move_pain_ext_1><xsl:value-of select="./@selected"/></back_move_pain_ext_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Rotasjon'">
                                    <back_move_pain_rot_1><xsl:value-of select="./@selected"/></back_move_pain_rot_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Lateralfleksjon'">
                                    <back_move_pain_lat_1><xsl:value-of select="./@selected"/></back_move_pain_lat_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ingen smerter ved aktive bevgelsesutslag'">
                                    <back_move_pain_not_1><xsl:value-of select="./@selected"/></back_move_pain_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Nevrologiske funn '">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke aktuelt'">
                                    <back_neuro_not_1><xsl:value-of select="./@selected"/></back_neuro_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Nevrologiske funn '">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Redusert kraft'">
                                    <back_neuro_pow_1><xsl:value-of select="./@selected"/></back_neuro_pow_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Nevrologiske funn '">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Redusert sensibilitet'">
                                    <back_neuro_sens_1><xsl:value-of select="./@selected"/></back_neuro_sens_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Ryggundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Nevrologiske funn '">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Unormale reflekser'">
                                    <back_neuro_reflex_1><xsl:value-of select="./@selected"/></back_neuro_reflex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <hip_move_rom_flex_1><xsl:value-of select="./@selected"/></hip_move_rom_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <hip_move_rom_ext_1><xsl:value-of select="./@selected"/></hip_move_rom_ext_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Abduksjon'">
                                    <hip_move_rom_abd_1><xsl:value-of select="./@selected"/></hip_move_rom_abd_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Adduksjon'">
                                    <hip_move_rom_add_1><xsl:value-of select="./@selected"/></hip_move_rom_add_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Utadrotasjon'">
                                    <hip_move_rom_extrot_1><xsl:value-of select="./@selected"/></hip_move_rom_extrot_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Innadrotasjon'">
                                    <hip_move_rom_introt_1><xsl:value-of select="./@selected"/></hip_move_rom_introt_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke reduserte bevegelsesutslag'">
                                    <hip_move_rom_not_1><xsl:value-of select="./@selected"/></hip_move_rom_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <hip_move_pain_flex_1><xsl:value-of select="./@selected"/></hip_move_pain_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <hip_move_pain_ext_1><xsl:value-of select="./@selected"/></hip_move_pain_ext_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Abduksjon'">
                                    <hip_move_pain_abd_1><xsl:value-of select="./@selected"/></hip_move_pain_abd_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Adduksjon'">
                                    <hip_move_pain_add_1><xsl:value-of select="./@selected"/></hip_move_pain_add_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Utadrotasjon'">
                                    <hip_move_pain_extrot_1><xsl:value-of select="./@selected"/></hip_move_pain_extrot_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Innadrotasjon'">
                                    <hip_move_pain_introt_1><xsl:value-of select="./@selected"/></hip_move_pain_introt_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ingen smerter ved aktive bevegelser'">
                                    <hip_move_pain_not_1><xsl:value-of select="./@selected"/></hip_move_pain_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <hip_move_passive_rom_flex_1><xsl:value-of select="./@selected"/></hip_move_passive_rom_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <hip_move_passive_rom_ext_1><xsl:value-of select="./@selected"/></hip_move_passive_rom_ext_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Abduksjon'">
                                    <hip_move_passive_rom_abd_1><xsl:value-of select="./@selected"/></hip_move_passive_rom_abd_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Adduksjon'">
                                    <hip_move_passive_rom_add_1><xsl:value-of select="./@selected"/></hip_move_passive_rom_add_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Utadrotasjon'">
                                    <hip_move_passive_rom_extrot_1><xsl:value-of select="./@selected"/></hip_move_passive_rom_extrot_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Innadrotasjon'">
                                    <hip_move_passive_rom_introt_1><xsl:value-of select="./@selected"/></hip_move_passive_rom_introt_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke reduserte bevegelsesutslag'">
                                    <hip_move_passive_rom_not_1><xsl:value-of select="./@selected"/></hip_move_passive_rom_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <hip_move_passive_pain_flex_1><xsl:value-of select="./@selected"/></hip_move_passive_pain_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <hip_move_passive_pain_ext_1><xsl:value-of select="./@selected"/></hip_move_passive_pain_ext_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Abduksjon'">
                                    <hip_move_passive_pain_abd_1><xsl:value-of select="./@selected"/></hip_move_passive_pain_abd_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Adduksjon'">
                                    <hip_move_passive_pain_add_1><xsl:value-of select="./@selected"/></hip_move_passive_pain_add_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Utadrotasjon'">
                                    <hip_move_passive_pain_extrot_1><xsl:value-of select="./@selected"/></hip_move_passive_pain_extrot_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Innadrotasjon'">
                                    <hip_move_passive_pain_introt_1><xsl:value-of select="./@selected"/></hip_move_passive_pain_introt_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ingen smerter ved aktive bevegelser'">
                                    <hip_move_passive_pain_not_1><xsl:value-of select="./@selected"/></hip_move_passive_pain_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smertelokalisasjon hofte (pasientens vurdering)'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke aktuelt'">
                                    <hip_pain_not_1><xsl:value-of select="./@selected"/></hip_pain_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smertelokalisasjon hofte (pasientens vurdering)'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Lateralt'">
                                    <hip_pain_lat_1><xsl:value-of select="./@selected"/></hip_pain_lat_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smertelokalisasjon hofte (pasientens vurdering)'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Medial/lyske'">
                                    <hip_pain_med_1><xsl:value-of select="./@selected"/></hip_pain_med_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smertelokalisasjon hofte (pasientens vurdering)'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Posteriort'">
                                    <hip_pain_post_1><xsl:value-of select="./@selected"/></hip_pain_post_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Hofteundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smertelokalisasjon hofte (pasientens vurdering)'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Anteriort'">
                                    <hip_pain_ant_1><xsl:value-of select="./@selected"/></hip_pain_ant_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <knee_move_rom_flex_1><xsl:value-of select="./@selected"/></knee_move_rom_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <knee_move_rom_ext_1><xsl:value-of select="./@selected"/></knee_move_rom_ext_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke reduserte bevegelsesutslag'">
                                    <knee_move_rom_not_1><xsl:value-of select="./@selected"/></knee_move_rom_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <knee_move_pain_flex_1><xsl:value-of select="./@selected"/></knee_move_pain_flex_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <knee_move_pain_ext_1><xsl:value-of select="./@selected"/></knee_move_pain_ext_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ingen smerter ved aktive bevegelser'">
                                    <knee_move_pain_not_1><xsl:value-of select="./@selected"/></knee_move_pain_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <knee_passive_flexlim_1><xsl:value-of select="./@selected"/></knee_passive_flexlim_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <knee_passive_extlim_1><xsl:value-of select="./@selected"/></knee_passive_extlim_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Reduserte bevegelsesutslag i'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ikke reduserte bevegelsesutslag'">
                                    <knee_passive_notlim_1><xsl:value-of select="./@selected"/></knee_passive_notlim_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Fleksjon'">
                                    <knee_passive_flexpain_1><xsl:value-of select="./@selected"/></knee_passive_flexpain_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ekstensjon'">
                                    <knee_passive_extpain_1><xsl:value-of select="./@selected"/></knee_passive_extpain_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="@name = 'Kneundersøkelse'">
                    <xsl:for-each select="question">
                        <xsl:if test="@name = 'Smerter ved'">
                            <xsl:for-each select="answer">
                                <xsl:if test=".='Ingen smerter ved passive bevegelser'">
                                    <knee_passive_pain_not_1><xsl:value-of select="./@selected"/></knee_passive_pain_not_1>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <!-- Code for condition : 7  ......................... END -->


            </xsl:for-each>
        </patient>
    </xsl:template>
</xsl:stylesheet>
