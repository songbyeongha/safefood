package com.ssafy.parser;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

public class MapParser {
	public final static String PHARM_URL = "http://data.jeonnam.go.kr/rest/namdoEcofood/getNdEcofoodMenuFile";
    public final static String KEY = "ydbSTYPg7SixNHmoLQpJDjl%2BHOjdDUMHwVrc4p0kN3GYSfOFHiHt82PySMn6DQdp6W9T%2BlXdj28GxDkKjHhOJA%3D%3D";
 
    public MapParser() {
        try {
            apiParserSearch();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
 
    
    /**
     * 
     * @throws Exception
     */
    public void apiParserSearch() throws Exception {
        URL url = new URL(getURLParam(null));
 
        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        factory.setNamespaceAware(true);
        XmlPullParser xpp = factory.newPullParser();
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        xpp.setInput(bis, "utf-8");
        
        String tag = null;
        int event_type = xpp.getEventType();
        
        ArrayList<String> list = new ArrayList<String>();
        
        String foodZoneNm = null;
        while (event_type != XmlPullParser.END_DOCUMENT) {
            if (event_type == XmlPullParser.START_TAG) {
                tag = xpp.getName();
            } else if (event_type == XmlPullParser.TEXT) {
                /**
                 * 약국의 주소만 가져와본다.
                 */
                if(tag.equals("foodZoneNm")){
                	foodZoneNm = xpp.getText();
                }
            } else if (event_type == XmlPullParser.END_TAG) {
                tag = xpp.getName();
                if (tag.equals("item")) {
                    list.add(foodZoneNm);
                }
            }
 
            event_type = xpp.next();
        }
        printList(list);
        System.out.println(list);
    }
    
    /**
     * 결과 값을 출력해본다.
     * @param list
     */
    private void printList(ArrayList<String> list){
        for(String entity : list){
            System.out.println(entity);
        }
        
        
    }
    
    
    
    private String getURLParam(String search){
        String url = PHARM_URL+"?ServiceKey="+KEY;
        if(search != null){
        url = url+"&yadmNm"+search;
        }
        return url;
    }
 
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        new MapParser();
    }
}
