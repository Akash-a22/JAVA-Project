package task;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Task {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "id")
	@SequenceGenerator(initialValue = 101,allocationSize = 1,name = "id",sequenceName = "my_seq")
	private int id;
	private String description;
	private LocalDateTime creadtedDateAndTime;
	private LocalDateTime completedDateAndTime;
	private String statusOfTask;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

}
