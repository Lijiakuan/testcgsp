package com.equipments.management.dto;

import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.*;
import java.util.Map;

public class ExportDoc {
    private Configuration configuration;
    private String encoding;

    public ExportDoc(String encoding) {
        this.encoding = encoding;
        configuration = new Configuration(Configuration.VERSION_2_3_26);
        configuration.setDefaultEncoding(encoding);
        //configuration.setClassForTemplateLoading(this.getClass(), "");

        try {
            configuration.setDirectoryForTemplateLoading(new File("c:/templates"));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private Template getTemplate(String name) throws Exception {
        return configuration.getTemplate(name);
    }

    public void exportDoc(String doc, String name,Map<String, Object> dataMap) throws Exception {
        Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(doc), encoding));
        getTemplate(name).process(dataMap, writer);
    }

}
