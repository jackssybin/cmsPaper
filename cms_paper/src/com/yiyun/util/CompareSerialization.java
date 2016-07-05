package com.yiyun.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Random;

public class CompareSerialization {

    public String generateTestData(int stringLength) {

        Random random = new Random();

        StringBuilder builder = new StringBuilder(stringLength);

        for (int j = 0; j < stringLength; j++) {

            builder.append((char) random.nextInt(127));

        }

        return builder.toString();

    }

    public int testJavaDefault(String data) throws Exception {

        ObjectOutputStream outputStream = null;

        ObjectInputStream inputStream = null;

        try {

            ByteArrayOutputStream byteArray = new ByteArrayOutputStream();

            outputStream = new ObjectOutputStream(byteArray);

            outputStream.writeObject(data);

            outputStream.flush();

            inputStream = new ObjectInputStream(new ByteArrayInputStream(byteArray.toByteArray()));

            inputStream.readObject();

            return byteArray.size();

        }

        finally {

            outputStream.close();

            inputStream.close();

        }

    }

    public int testJavaDefaultBytes(String data) throws Exception {

        ObjectOutputStream outputStream = null;

        ObjectInputStream inputStream = null;

        try {

            ByteArrayOutputStream byteArray = new ByteArrayOutputStream();

            outputStream = new ObjectOutputStream(byteArray);

            outputStream.writeBytes(data);

            outputStream.flush();

            inputStream = new ObjectInputStream(new ByteArrayInputStream(byteArray.toByteArray()));

            byte[] bytes = new byte[byteArray.size()];

            inputStream.read(new byte[byteArray.size()]);

            new String(bytes);

            return byteArray.size();

        }

        finally {

            outputStream.close();

            inputStream.close();

        }

    }

   /* public int testSwizzle(Swizzle data) throws Exception {

        ObjectOutputStream outputStream = null;

        ObjectInputStream inputStream = null;

        try {

            ByteArrayOutputStream byteArray = new ByteArrayOutputStream();

            outputStream = new ObjectOutputStream(byteArray);

            outputStream.writeObject(data);

            outputStream.flush();

            inputStream = new ObjectInputStream(new ByteArrayInputStream(byteArray.toByteArray()));

            inputStream.readObject();

            return byteArray.size();

        }

        finally {

            outputStream.close();

            inputStream.close();

        }

    }*/

    public int testStringUTF(String data) throws Exception {

        ObjectOutputStream outputStream = null;

        ObjectInputStream inputStream = null;

        try {

            ByteArrayOutputStream byteArray = new ByteArrayOutputStream();

            outputStream = new ObjectOutputStream(byteArray);

            outputStream.writeUTF(data);

            outputStream.flush();

            inputStream = new ObjectInputStream(new ByteArrayInputStream(byteArray.toByteArray()));

            inputStream.readUTF();

            return byteArray.size();

        }

        finally {

            outputStream.close();

            inputStream.close();

        }

    }

    public final static void main(String[] args) throws Exception {

        CompareSerialization compare = new CompareSerialization();

        String data = compare.generateTestData(Integer.parseInt(args[0]));

//        Swizzle swizzle = new Swizzle(data);

        System.out.println("testJavaDefault size on networking:" + compare.testJavaDefault(data));

        System.out.println("testJavaDefaultBytes size on networking:" + compare.testJavaDefaultBytes(data));

        System.out.println("testStringUTF size on networking:" + compare.testStringUTF(data));

//        System.out.println("testSwizzle size on networking:" + compare.testSwizzle(swizzle));

        // warm up

        for (int i = 0; i < 100; i++) {

            compare.testJavaDefault(data);

            compare.testJavaDefaultBytes(data);

            compare.testStringUTF(data);

//            compare.testSwizzle(swizzle);

        }

        long startTime = System.currentTimeMillis();

        for (int i = 0; i < 10000; i++) {

            compare.testJavaDefault(data);

        }

        long endTime = System.currentTimeMillis();

        System.out.println("testJavaDefault using time:" + (endTime-startTime));

        startTime = System.currentTimeMillis();

        for (int i = 0; i < 10000; i++) {

            compare.testJavaDefaultBytes(data);

        }

        endTime = System.currentTimeMillis();

        System.out.println("testJavaDefaultBytes using time:" + (endTime-startTime));

        startTime = System.currentTimeMillis();

        for (int i = 0; i < 10000; i++) {

            compare.testStringUTF(data);

        }

        endTime = System.currentTimeMillis();

        System.out.println("testStringUTF using time:" + (endTime-startTime));

        startTime = System.currentTimeMillis();

       /* for (int i = 0; i < 10000; i++) {

            compare.testSwizzle(swizzle);

        }
*/
        endTime = System.currentTimeMillis();

        System.out.println("testSwizzle using time:" + (endTime-startTime));

    }

}