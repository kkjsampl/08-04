package com.example.demo.entity;

import java.time.*;

import lombok.*;
import lombok.experimental.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class Board {
	private Long bno;
	private String title;
	private String content;
	private String nickname;
	private String password;
	private LocalDate writeday;
	private Long readcnt;
}
